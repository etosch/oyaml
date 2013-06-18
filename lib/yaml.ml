open Types

type t = Types.node list

let process = function
	| Scalar s -> "scalar"
	| _ -> "unrecognised"

let dump s =
	print_endline (process s)

let parse s = 
	let lexbuf = Lexing.from_string s in
	let nodes = Parser.input Lexer.token lexbuf in
		List.iter dump nodes;
		nodes
