package main

import (
	"github.com/gin-gonic/gin"
)

var port string = ":8888"

func livenessCheck(c *gin.Context) {
	c.JSON(200, "OK")
}

func main() {
	app := gin.Default()
	app.GET("/liveness", livenessCheck)
	app.Run(port)
}
