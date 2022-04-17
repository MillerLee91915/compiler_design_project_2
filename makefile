all:
	java -cp ./antlr-3.5.2-complete.jar org.antlr.Tool myparser.g
	javac -cp ./antlr-3.5.2-complete.jar:. testParser.java
	java -cp ./antlr-3.5.2-complete.jar:. testParser sample1.c > result1.txt
	java -cp ./antlr-3.5.2-complete.jar:. testParser sample2.c > result2.txt
	java -cp ./antlr-3.5.2-complete.jar:. testParser sample3.c > result3.txt
clean:
	rm -f myparser.tokens myparserLexer.java myparserParser.java *.class *.txt