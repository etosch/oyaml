
(*
  Oyaml, a YAML parser for OCaml

  Copyright (C) 2013  Martin Keegan

  This programme is free software; you may redistribute and/or modify
  it under the terms of the Apache License v2.0
*)

open Types

type t = Types.node list

let process = function
	| Scalar s -> Printf.sprintf "scalar(%s)" s
	| _ -> "unrecognised"

let dump s =
	print_endline (process s)

let parse s = 
	let lexbuf = Lexing.from_string s in
	let nodes = Parser.input Lexer.token lexbuf in
		List.iter dump nodes;
		nodes
