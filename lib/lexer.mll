{
	open Parser
	open Lexing
	open Types
	let incr_lineno lexbuf =
		let pos = lexbuf.lex_curr_p in
			lexbuf.lex_curr_p <- { pos with
				pos_lnum = pos.pos_lnum + 1;
				pos_bol = pos.pos_cnum;
			}
}

let digit = ['0'-'9']
let nonquote = [ ^ '"' ]
let nonnl = [ ^ '\n' ]

rule token = parse
(*	| [' ' '\t']	{ token lexbuf } *)
    | ' ' { SPACE }
    | '"' nonquote* as s '"' { QUOTED_STRING (Scalar s) }
	| '\n'		{ incr_lineno lexbuf; token lexbuf }
	| "-"? digit+ as num { NUM (Scalar num) }
	| '+'		{ PLUS }
	| '-'       { MINUS }
    | ':'       { COLON }
	| '#' nonnl*  { token lexbuf }
	| "---" { TRIPLE_DASH }
	| eof { EOF }
