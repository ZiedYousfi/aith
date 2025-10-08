package main

import (
	"bytes"
	"context"
	_ "embed"

	"github.com/ZiedYousfi/aith/templates"
	"github.com/gofiber/fiber/v2"
)

func main() {
	app := fiber.New()

	app.Get("/", hello)

	app.Listen(":3000")
}

func hello(c *fiber.Ctx) error {
	component := templates.Layout("Welcome to My Website")

	var buf bytes.Buffer
	if err := component.Render(context.Background(), &buf); err != nil {
		return err
	}

	c.Set("Content-Type", "text/html")
	return c.SendString(buf.String())
}
