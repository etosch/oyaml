
open Yaml

let dump_yaml = function
	| _ -> "not supported"

let () = 
	let s = Yaml.parse "INVALID INPUT\n" in
		print_endline "Dummy output:";
		print_endline (dump_yaml s)
