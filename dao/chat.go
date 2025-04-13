package dao

import (
	"GraduationDesign/models"
	"GraduationDesign/util"
	"log"
)

// SaveMessage 保存聊天消息到数据库
func SaveMessage(sender, receiver, content string) error {
	message := models.Message{
		Sender:    sender,
		Receiver:  receiver,
		Content:   content,
		Timestamp: util.GetCurrentTime(),
	}

	// 保存消息到数据库
	if err := db.Create(&message).Error; err != nil {
		log.Println("保存聊天消息失败：", err)
		return err
	}
	return nil
}

// GetMessages 根据发送者和接收者获取聊天记录
func GetMessages(sender, receiver string) ([]models.Message, error) {
	var messages []models.Message

	// 查询聊天记录
	if err := db.Where("(sender = ? AND receiver = ?) OR (sender = ? AND receiver = ?)", sender, receiver, receiver, sender).
		Order("timestamp ASC").Find(&messages).Error; err != nil {
		log.Println("获取聊天记录失败：", err)
		return nil, err
	}
	return messages, nil
}
