package main

import (
	"fmt"
	"github.com/aws/aws-lambda-go/lambda"
)

type EventData struct {
	Name string `json:"What is your name?"`
	Age  int    `json:"How old are you?"`
}

type ResponseData struct {
	Message string `json:"Answer:"`
}

func HandleLambdaEvent(event EventData) (ResponseData, error) {
	return ResponseData{Message: fmt.Sprintf("%s is %d years old!", event.Name, event.Age)}, nil
}

func main() {
	lambda.Start(HandleLambdaEvent)
}
