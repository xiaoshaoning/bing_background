bing url2file : bing.l url2file.c
	flex bing.l
	gcc lex.yy.c -lfl -o bing
	gcc url2file.c -I/usr/include/ -lcurl
clean :
	rm -f url2file
	rm -f bing
	rm -f lex.yy.c