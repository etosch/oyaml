
type t = 
	| Yaml of string

let parse s = 
	let lexbuf = Lexing.from_channel stdin in
		while (Parser.input Lexer.token lexbuf) do
			()
		done;
		Yaml s
