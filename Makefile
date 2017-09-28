CC=gcc -g -Og
#customize the following settings
INCFLAGS=-I../include
LIBFLAGS=-L../lib
LIBDEPS=
CFLAGS=$(INCFLAGS) $(LIBFLAGS)

new:
	for f in $(shell find . -name '*.c' -newer timestamp -type f -exec basename {} \;); do \
		make --no-print-directory $${f%.*}; \
	done && touch timestamp

%:%.c 
	$(CC) -o $@ $< $(CFLAGS)  $(LIBDEPS)

.PHONY:clean new

clean:
	ls | grep -v "[.][ch]" | grep -iv makefile | xargs rm
	touch timestamp
	sleep 0.1
	touch *.c





