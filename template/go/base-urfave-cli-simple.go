package main

import (
	"fmt"
	"os"

	"github.com/urfave/cli/v2"
)

var version = "0.1.0"

func main() {
	newApp().Run(os.Args)
}

func newApp() *cli.App {
	app := cli.NewApp()
	app.Name = "{{_cursor_}}hello-world"
	app.Usage = "Hello, World."
	app.Version = version
	app.Authors = []*cli.Author{
		{
			Name:  "Michito Maeda",
			Email: "michito.maeda@gmail.com",
		},
	}
	app.Action = func(c *cli.Context) error {
		fmt.Println("Hello World!")
		return nil
	}

	return app
}
