
(*
  Oyaml, a YAML parser for OCaml

  Copyright (C) 2013  Martin Keegan

  This programme is free software; you may redistribute and/or modify
  it under the terms of the Apache License v2.0
*)

open Yaml

(* worst ocaml i've ever written *)
let read_all_stdin () =
	let buf = ref "" in
	let ic = stdin in
		(try while true 
			do let line = input_line ic in
				   buf := !buf ^ line
			done
		 with End_of_file ->	
			 close_in ic);
		!buf


let () = 
	let text = read_all_stdin () in
	let s = Yaml.parse text in
		ignore s
