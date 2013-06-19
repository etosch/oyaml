
(*
  Oyaml, a YAML parser for OCaml

  Copyright (C) 2013  Martin Keegan

  This programme is free software; you may redistribute and/or modify
  it under the terms of the Apache License v2.0
*)

type node =
	| Int of int
	| Str of string
	| Map of string * string
	| Sequence of string
