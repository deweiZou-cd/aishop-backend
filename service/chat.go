package service

import (
	"GraduationDesign/dao"
	"GraduationDesign/models"
)

type ChatService struct{}

func (cs *ChatService) SaveMessage(sender, receiver, content string) error {
	return dao.SaveMessage(sender, receiver, content)
}

func (cs *ChatService) GetMessages(sender, receiver string) ([]models.Message, error) {
	return dao.GetMessages(sender, receiver)
}
