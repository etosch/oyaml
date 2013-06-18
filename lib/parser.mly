
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
%token SPACE
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
    | exp { print_endline "wtf?"; $1 }
;
exp:
    | NUM { print_endline "ook!"; $1 }
;
