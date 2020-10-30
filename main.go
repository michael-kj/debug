package main

import (
	"github.com/gin-gonic/gin"
	"github.com/kirinlabs/HttpRequest"
	"os"
)

func main() {
	r := gin.Default()
	r.GET("/ping", func(c *gin.Context) {
		host, _ := os.Hostname()
		c.JSON(200, gin.H{
			"message": host,
		})
	})

	r.GET("/headers", func(c *gin.Context) {

		c.JSON(200, gin.H{
			"header": c.Request.Header,
		})
	})

	r.GET("/proxy", func(c *gin.Context) {
		host := c.DefaultQuery("host", "")
		if host == "" {
			c.JSON(200, gin.H{
				"err": "host can not be empty",
			})
			return
		}
		res, err := HttpRequest.Get(host)
		if err != nil {
			c.JSON(200, gin.H{
				"err": err.Error(),
			})
			return
		}
		body, _ := res.Body()
		c.JSON(200, gin.H{
			"statusCode": res.Response().StatusCode,
			"body":       string(body),
		})
	})

	r.Run(":8080")
}
