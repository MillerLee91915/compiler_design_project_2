grammar myparser;

options {
	language = Java;
	backtrack = true;
}

/*----------------------*/
/*        PARSER        */
/*----------------------*/

@header {
    // import packages here.
}

@members {
    boolean TRACEON = true;
}

program:
	Void Main '(' ')' '{' declarations statements '}' {if (TRACEON) System.out.println("VOID MAIN () {declarations statements}");
		};

primaryExprssion:
	Constant {if (TRACEON) System.out.println("primaryExprssion: Constant");}
	| Identifier {if (TRACEON) System.out.println("primaryExprssion: Identifier");}
	| '(' expression ')' {if (TRACEON) System.out.println("primaryExprssion: ( expression )");};

declarations:
	type Identifier (',' Identifier)*';' declarations {if (TRACEON) System.out.println("declarations: type Identifier (, Identifier)*; declarations");
		}
	| {if (TRACEON) System.out.println("declarations: ε");};

type:
	Int {if (TRACEON) System.out.println("type: Int");}
	| Float {if (TRACEON) System.out.println("type: Float");};

statements:
	statement statements {if (TRACEON) System.out.println("statements: statement statements");}
	| {if (TRACEON) System.out.println("statements: ε");};

signExprssion:
	primaryExprssion {if (TRACEON) System.out.println("signExprssion: primaryExprssion");}
	| '-' primaryExprssion {if (TRACEON) System.out.println("signExprssion: - primaryExprssion");};

multiplicativeExpression:
	signExprssion ('*' signExprssion)* {if (TRACEON) System.out.println("multiplicativeExpression: signExprssion (* signExprssion)*");
		}
	| signExprssion ('/' signExprssion)* {if (TRACEON) System.out.println("multiplicativeExpression: signExprssion (/ signExprssion)*");
		}
	| signExprssion ('%' signExprssion)* {if (TRACEON) System.out.println("multiplicativeExpression: signExprssion (\% signExprssion)*");
		};

additiveExpression:
	multiplicativeExpression ('+' multiplicativeExpression)* {if (TRACEON) System.out.println("additiveExpression:multiplicativeExpression (+ multiplicativeExpression)*");
		}
	| multiplicativeExpression ('-' multiplicativeExpression)* {if (TRACEON) System.out.println("additiveExpression:multiplicativeExpression (- multiplicativeExpression)*");
		};

relationalExpression:
	additiveExpression ('<' additiveExpression)* {if (TRACEON) System.out.println("relationalExpression:additiveExpression (< additiveExpression)*");
		}
	| additiveExpression ('>' additiveExpression)* {if (TRACEON) System.out.println("relationalExpression:additiveExpression (> additiveExpression)*");
		}
	| additiveExpression ('<=' additiveExpression)* {if (TRACEON) System.out.println("relationalExpression:additiveExpression (<= additiveExpression)*");
		}
	| additiveExpression ('>=' additiveExpression)* {if (TRACEON) System.out.println("relationalExpression:additiveExpression (>= additiveExpression)*");
		};

equalityExpression:
	relationalExpression ('==' relationalExpression)* {if (TRACEON) System.out.println("equalityExpression: relationalExpression (== relationalExpression)*");
		}
	| relationalExpression ('!=' relationalExpression)* {if (TRACEON) System.out.println("equalityExpression: relationalExpression (!= relationalExpression)*");
		};

logicalAndExpression:
	equalityExpression ('&&' equalityExpression)* {if (TRACEON) System.out.println("logicalAndExpression: equalityExpression (&& equalityExpression)*");
		};

logicalOrExpression:
	logicalAndExpression ('||' logicalAndExpression)* {if (TRACEON) System.out.println("logicalOrExpression: logicalAndExpression (|| logicalAndExpression)*");
		};

assignmentExpression:
	logicalOrExpression {if (TRACEON) System.out.println("assignmentExpression: logicalOrExpression");
		}
	| Identifier assignmentOperator assignmentExpression {if (TRACEON) System.out.println("assignmentExpression: Identifier assignmentOperator assignmentExpression");
		};

assignmentOperator:
	'=' {if (TRACEON) System.out.println("assignmentOperator: =");}
	| '*=' {if (TRACEON) System.out.println("assignmentOperator: *=");}
	| '/=' {if (TRACEON) System.out.println("assignmentOperator: /=");}
	| '%=' {if (TRACEON) System.out.println("assignmentOperator: \%=");}
	| '+=' {if (TRACEON) System.out.println("assignmentOperator: +=");}
	| '-=' {if (TRACEON) System.out.println("assignmentOperator: -=");};

expression:
	assignmentExpression (',' assignmentExpression)* {if (TRACEON) System.out.println("expression: assignmentExpression");
		}
	| Identifier '++' {if (TRACEON) System.out.println("Identifier '++'");}
	| Identifier '--' {if (TRACEON) System.out.println("Identifier '--'");}
	| '++' Identifier {if (TRACEON) System.out.println("'++' Identifier");}
	| '--' Identifier {if (TRACEON) System.out.println("'--' Identifier");}
	| Printf '(' String (',' '%' Identifier)* ')' {if (TRACEON) System.out.println("expression : printf( String (\% Identifier)* )");
			}
	| 'scanf' '(' String (',' '&' Identifier)* ')' {if (TRACEON) System.out.println("expression : scanf( String (& Identifier)* )");
			}
	| Return Constant {if (TRACEON) System.out.println("expression : Return Constant");};

statement:
	expressionStatement {if (TRACEON) System.out.println("statement : expressionStatement ");}
	| compoundStatement {if (TRACEON) System.out.println("statement : compoundStatement");}
	| iterationStatement {if (TRACEON) System.out.println("statement : iterationStatement");}
	| selectionStatement {if (TRACEON) System.out.println("statement : selectionStatement");};

compoundStatement:
	'{' declarations statements '}' {if (TRACEON) System.out.println("compoundStatement : { declarations statements }");
		};

expressionStatement:
	expression? ';' {if (TRACEON) System.out.println("expressionStatement: expression? ;");};

selectionStatement:
	If '(' expression ')' statement ('elseif' statement)* ('else' statement)? {if (TRACEON) System.out.println("selectionStatement: If (expression) statement (elseif statement)* (Else statement)?");
		};

iterationStatement:
	While '(' expression ')' statement {if (TRACEON) System.out.println("iterationStatement: While (expression) statemen");
		}
	| Do statement While '(' expression ')' ';' {if (TRACEON) System.out.println("iterationStatement: Do statement While (expression) ;");
		}
	| For '(' expression? ';' expression? ';' expression? ')' statement {if (TRACEON) System.out.println("iterationStatement:For (expression? ; expression? ; expression? )statement");
		};

/*----------------------*/
/*         LEXER        */
/*----------------------*/

Auto: 'auto';
Break: 'break';
Case: 'case';
Char: 'char';
Const: 'const';
Continue: 'continue';
Default: 'default';
Do: 'do';
Double: 'double';
Else: 'else';
Enum: 'enum';
Extern: 'extern';
Float: 'float';
For: 'for';
Goto: 'goto';
If: 'if';
Inline: 'inline';
Int: 'int';
Long: 'long';
Register: 'register';
Restrict: 'restrict';
Return: 'return';
Short: 'short';
Signed: 'signed';
Sizeof: 'sizeof';
Static: 'static';
Struct: 'struct';
Switch: 'switch';
Typedef: 'typedef';
Union: 'union';
Unsigned: 'unsigned';
Void: 'void';
Volatile: 'volatile';
While: 'while';

Printf: 'printf';
Main: 'main';

Not: '!';
Less: '<';
LessEqual: '<=';
Greater: '>';
GreaterEqual: '>=';
Equal: '==';
NotEqual: '!=';
AndAnd: '&&';
OrOr: '||';

Plus: '+';
PlusPlus: '++';
Minus: '-';
MinusMinus: '--';
Star: '*';
Div: '/';
Mod: '%';
StarAssign: '*=';
DivAssign: '/=';
ModAssign: '%=';
PlusAssign: '+=';
MinusAssign: '-=';

Assign: '=';

LeftShift: '<<';
RightShift: '>>';
And: '&';
Or: '|';
Caret: '^';
LeftShiftAssign: '<<=';
RightShiftAssign: '>>=';
AndAssign: '&=';
XorAssign: '^=';
OrAssign: '|=';
Tilde: '~';

Comma: ',';
Question: '?';
Colon: ':';
Semi: ';';
Hastag: '#';

LeftParen: '(';
RightParen: ')';
LeftBracket: '[';
RightBracket: ']';
LeftBrace: '{';
RightBrace: '}';

Arrow: '->';
Dot: '.';
Ellipsis: '...';

Identifier: Nondigit (Nondigit | Digit)*;
fragment Nondigit: 'a' ..'z' | 'A' ..'Z' | '_';
fragment Digit: '0' ..'9';

Constant: IntegerConstant | FloatingConstant;
// | CharacterConstant;
fragment IntegerConstant: ('0' | ('1' ..'9') (Digit)*);
fragment FloatingConstant: Digitsequence? '.' Digitsequence;
fragment Digitsequence: Digit+;

String: '"' (.)* '"';

LineComment: '//' (.)* '\n'+ { skip(); };
BlockComment: '/*' (.)* '*/'+ { skip(); };

NewLine: '\n' { skip(); };
WhiteSpace: (' ' | '\r' | '\t')+ { skip(); };