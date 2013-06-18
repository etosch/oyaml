%{
open Lexing
open Types
%}

%token EOF
%token <Types.node> NUM
%token PLUS
%token COLON
%token MINUS

%left PLUS
%start input
%type <Types.node list> input

%%
input:
    | EOF { [] }
    | cunit input { $1 :: $2 }
;
cunit:
    | exp { $1 }
;
exp:
    | NUM { $1 }
;
