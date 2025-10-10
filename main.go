package main

import (
	_ "embed"

	"github.com/ZiedYousfi/aith/templates"
	"github.com/a-h/templ"
	"github.com/gofiber/fiber/v2"
	"github.com/gofiber/fiber/v2/middleware/adaptor"
)

func main() {
	app := fiber.New()

	app.Get("/", hello)

	app.Listen(":3000")
}

func hello(c *fiber.Ctx) error {
	t := templates.Layout("ee")
	handler := adaptor.HTTPHandler(templ.Handler(t))
	return handler(c)
}
