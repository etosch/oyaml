
open Yaml

let dump_yaml = function
	| _ -> "not supported"

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
		print_endline "Dummy output:";
		print_endline (dump_yaml s)
