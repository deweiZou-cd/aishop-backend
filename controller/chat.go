package controller

import (
	"GraduationDesign/service"
	"net/http"
	"sync"

	"github.com/gin-gonic/gin"
	"github.com/gorilla/websocket"
)

var chatService service.ChatService
var clients = make(map[string]*websocket.Conn)
var lock = sync.Mutex{}

type Message struct {
	Sender    string `json:"sender"`
	Receiver  string `json:"receiver"`
	Content   string `json:"content"`
	Timestamp string `json:"timestamp"`
}

// WebSocket 升级器
var upgrader = websocket.Upgrader{
	CheckOrigin: func(r *http.Request) bool {
		return true
	},
}

// WebSocket 接口：实时通信
func HandleWebSocket(c *gin.Context) {
	user := c.Query("user")
	conn, err := upgrader.Upgrade(c.Writer, c.Request, nil)
	if err != nil {
		c.JSON(http.StatusBadRequest, Resp(400, "Failed to upgrade to WebSocket"))
		return
	}

	lock.Lock()
	clients[user] = conn
	lock.Unlock()

	defer func() {
		lock.Lock()
		delete(clients, user)
		lock.Unlock()
		conn.Close()
	}()

	for {
		var msg Message
		if err := conn.ReadJSON(&msg); err != nil {
			break
		}

		// 转发消息
		sendMessageToClient(msg)

		// 存储到数据库
		chatService.SaveMessage(msg.Sender, msg.Receiver, msg.Content)
	}
}

func sendMessageToClient(msg Message) {
	lock.Lock()
	defer lock.Unlock()

	if conn, ok := clients[msg.Receiver]; ok {
		conn.WriteJSON(msg)
	}
}

// REST API 接口：发送消息
func SendMessage(c *gin.Context) {
	var msg Message
	if err := c.ShouldBindJSON(&msg); err != nil {
		c.JSON(http.StatusBadRequest, Resp(400, "Invalid payload"))
		return
	}

	// 存储消息到数据库
	err := chatService.SaveMessage(msg.Sender, msg.Receiver, msg.Content)
	if err != nil {
		c.JSON(http.StatusInternalServerError, Resp(500, "Failed to save message"))
		return
	}

	// 转发消息
	sendMessageToClient(msg)
	c.JSON(http.StatusOK, Resp(200, "Message sent successfully"))
}

// REST API 接口：获取聊天记录
func GetChatHistory(c *gin.Context) {
	sender := c.Query("sender")
	receiver := c.Query("receiver")

	messages, err := chatService.GetMessages(sender, receiver)
	if err != nil {
		c.JSON(http.StatusInternalServerError, Resp(500, "Failed to retrieve messages"))
		return
	}

	c.JSON(http.StatusOK, Resp(200, messages))
}
