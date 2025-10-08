package main

import (
	_ "embed"

	"github.com/gofiber/fiber/v2"
)

func main() {
	app := fiber.New()

	app.Get("/", hello)

	app.Listen(":3000")
}

// hello sends a plain-text "Hello, World!" response using the provided Fiber context.
// It writes the string to the response and returns any error encountered while sending.
// @param c - The Fiber context for the incoming HTTP request.
// @return error - An error if sending the response fails, otherwise nil.
func hello(c *fiber.Ctx) error {
	return c.SendString("Hello, World!")
}
