/*
 * {{_input_:name}}
 */

// {{_input_:name}} ...
type {{_input_:name}} int

// Definition of {{_input_:name}}
const (
	{{_cursor_}}North {{_input_:name}} = iota
	East
	South
	West
)

func (e {{_input_:name}}) String() string {
	return [...]string{
		"North",
		"East",
		"South",
		"West",
	}[e]
}
