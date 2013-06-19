
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
%token <Types.node> NUM
%token PLUS
%token COLON
%token MINUS
%token TRIPLE_DASH
%token <Types.node> QUOTED_STRING
%token <int> SPACE
%token EOL

%left PLUS
%start input
%type <Types.node option> input

%%
input:
    | EOF { None }
    | cunit { Some $1 }
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
    | NUM EOL { $1 }
	| sequence { Sequence $1 }
;
sequence:
	| seq_member sequence { $1 :: $2 }
;
seq_member:
	| COLON SPACE NUM EOL { $3 }
;
