
(*
  Oyaml, a YAML parser for OCaml

  Copyright (C) 2013  Martin Keegan

  This programme is free software; you may redistribute and/or modify
  it under the terms of the Apache License v2.0
*)

open Types

type t = Types.node list

let process = function
	| Str s -> Printf.sprintf "string(%s)" s
	| _ -> "unrecognised"

let dump s =
	print_endline (process s)

let parse s = 
	let lexbuf = Lexing.from_string s in
	let rec all_nodes acc =
		match (Parser.input Lexer.token lexbuf) with
			| None -> acc
			| Some n -> all_nodes (n :: acc)
	in
	let nodes = all_nodes [] in
		List.iter dump nodes;
		nodes

