package main

import (
	"fmt"
	"os"

	"github.com/urfave/cli"
)

var Version string = "0.1.0"

func main() {
	newApp().Run(os.Args)
}

func newApp() *cli.App {
	app := cli.NewApp()
	app.Name = "{{_cursor_}}hello"
	app.Usage = "Hello Go Cli World."
	app.Version = Version
	app.Author = "Michto Maeda"
	app.Email = "michito.maeda@gmail.com"
	app.Commands = Commands
	return app
}

var Commands = []cli.Command{
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

