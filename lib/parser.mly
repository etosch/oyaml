%{
open Lexing
open Types
%}

%token EOF
%token <int> NUM
%token PLUS
%token COLON
%token MINUS

%left PLUS
%start input
%type <bool> input

%%
input:
    | EOF { true }
    | cunit input { false }
;
cunit:
    | exp { "hello" }
;
exp:
    | NUM { $1 }
;
