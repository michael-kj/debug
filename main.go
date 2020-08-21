package main

import "github.com/gin-gonic/gin"




func main() {
	r := gin.Default()
	r.GET("/ping", func(c *gin.Context) {
		c.JSON(200, gin.H{
			"message": "pong",
		})
	})

	r.GET("/headers", func(c *gin.Context) {

		c.JSON(200, gin.H{
			"header": c.Request.Header,
		})
	})

	r.Run(":8080")
}
