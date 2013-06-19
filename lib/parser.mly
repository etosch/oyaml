
%{

(*
  Oyaml, a YAML parser for OCaml

  Copyright (C) 2013  Martin Keegan

  This programme is free software; you may redistribute and/or modify
  it under the terms of the Apache License v2.0
*)

open Lexing
open Types

%}

%token EOF
%token <int> NUM
%token <string> STRING
%token PLUS
%token COLON
%token MINUS
%token TRIPLE_DASH
%token <int> SPACE
%token EOL

%left PLUS
%start input
%type <Types.node option> input

%%
input:
    | EOF { None }
    | cunit EOL { Some $1 }
;
cunit:
	| cunit_bare { $1 }
	| cunit_headed { $1 }
;
cunit_headed:
	| TRIPLE_DASH EOL cunit_bare { $3 }
;
cunit_bare:
    | exp { $1 }
;
exp:
    | NUM { Int $1 }
	| STRING { Str $1 }
	| seq_member { Sequence $1 }
	| map_member { $1 }
;
seq_member:
	| MINUS SPACE STRING { $3 }
;
map_member:
	| STRING COLON SPACE STRING { Map ($1, $4) }
;
