
(*
  Oyaml, a YAML parser for OCaml

  Copyright (C) 2013  Martin Keegan

  This programme is free software; you may redistribute and/or modify
  it under the terms of the Apache License v2.0
*)

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
let nonquote = [ ^ '"' ' ' '\n' '-' ]

rule token = parse
    | ['\n']                 { EOL }
    | ' '+ as spaces         { SPACE (String.length spaces) }
    | "---"                  { TRIPLE_DASH }
    | nonquote+ as str       { STRING str }
    | digit+ as num          { NUM (int_of_string num) }
    | ':'                    { COLON }
    | '-'                    { MINUS }
    | eof                    { EOF }
    | ','		     { COMMA }
    | '{'		     { LBRACE }
    | '}'		     { RBRACE }
