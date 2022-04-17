# Compiler Design Project 2

# Description

Choose the set of C language which you want to support in your compiler, and write the lexical analyzer with ANTLR.

# How to Use

1. Make sure your JDK and ANTLR downloaded
2. Download the file from 
    https://github.com/MillerLee91915/compiler_design_project_2
3. use makefile to compile and execute 

after execution, you will generate three result.txt according to sample.c

# Grammer

According to the requirement, garmmer have to contain at least

- basic arithmetic statment
- if-then expression
- if-then-else expression
- for-loop expression
- while-loop expression

# CTG of my C

program: Void Main '(' ')' '{' declarations statements '}';

primaryExprssion: Constant | Identifier | '(' expression ')';

declarations:
	type Identifier (',' Identifier)* ';' declarations
	|;

type: Int | Float;

statements: statement statements |;

signExprssion: primaryExprssion | '-' primaryExprssion;

multiplicativeExpression:
	signExprssion ('*' signExprssion)*
	| signExprssion ('/' signExprssion)*
	| signExprssion ('%' signExprssion)*;

additiveExpression:
	multiplicativeExpression ('+' multiplicativeExpression)*
	| multiplicativeExpression ('-' multiplicativeExpression)*
};

relationalExpression:
	additiveExpression ('<' additiveExpression)*
	| additiveExpression ('>' additiveExpression)*
	| additiveExpression ('<=' additiveExpression)*
	| additiveExpression ('>=' additiveExpression)*;

equalityExpression:
	relationalExpression ('==' relationalExpression)*
	| relationalExpression ('!=' relationalExpression)*;

logicalAndExpression:
	equalityExpression ('&&' equalityExpression)*;

logicalOrExpression:
	logicalAndExpression ('||' logicalAndExpression)*;

assignmentExpression:
	logicalOrExpression
	| Identifier assignmentOperator assignmentExpression;

assignmentOperator: '=' | '*=' | '/=' | '%=' | '+=' | '-=';

expression:
	assignmentExpression (',' assignmentExpression)*
	| Identifier '++'
	| Identifier '--'
	| '++' Identifier
	| '--' Identifier
	| Printf '(' String (',' '%' Identifier)* ')'
	| 'scanf' '(' String (',' '&' Identifier)* ')'
	| Return Constant;

statement:
	expressionStatement
	| compoundStatement
	| iterationStatement
	| selectionStatement;

compoundStatement: '{' declarations statements '}';

expressionStatement: expression? ';';

selectionStatement:
	If '(' expression ')' statement ('elseif' statement)* (
		'else' statement
	)?;

iterationStatement:
	While '(' expression ')' statement
	| Do statement While '(' expression ')' ';'
	| For '(' expression? ';' expression? ';' expression? ')' statement;

# Example

Input:

```c
void main()
{
		int a;
}
```

Output:

type: Int
declarations: ε
declarations: type Identifier (, Identifier)*; declarations
statements: ε
VOID MAIN () {declarations statements}

Diagram:
```

					program
					   |
   -----------------------------------------------------	   
  |    |    |	 |	 |		|		|					
VOID  MAIN  (	 )   { 	declarations  statements 	}
			 |		|		
			 |		ε
	   ---------------------------------------------------------------------					
	  |		 |    			|		| 		|											type 		Identifier 	(, Identifier)* 	;	 declarations
 	  | 									|
	 Int                                   					ε
```

### Reference 

http://sandbox.mc.edu/~bennet/cs404/outl/cbnf.html
