CC=cc
CFLAGS=-std=c11 -g
LDFLAGS=-WL,-no_pie

9cc: 9cc.c
	$(CC) $(CFLAGS) $(LDFLAGS) -o 9cc 9cc.c

test: 9cc
	./test.sh

clean:
	rm -f 9cc *.o *~ tmp*
	rm -rf 9cc.dSYM

.PHONY: test clean
