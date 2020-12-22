package main

import (
	"fmt"
	"os"

	"github.com/urfave/cli/v2"
)

var version string = "0.1.0"

func main() {
	newApp().Run(os.Args)
}

func newApp() *cli.App {
	app := cli.NewApp()
	app.Name = "{{_cursor_}}hello"
	app.Usage = "Hello Go Cli World."
	app.Version = Version
	app.Authors = []*cli.Author{
		{
			Name:  "Michito Maeda",
			Email: "michito.maeda@gmail.com",
		},
	}
	app.Commands = commands
	return app
}

var commands = []cli.Command{
	cmdSay,
}

var cmdSay = cli.Command{
	Name:   "say",
	Usage:  "hello say",
	Action: say,
}

func say(c *cli.Context) error {
	fmt.Println("Hello, World")
	return nil
}
