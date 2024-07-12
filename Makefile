CC = gcc
CCFLAGS = -std=gnu99 -finline-functions -O
AR = ar
ARFLAGS = rcs
OBJS = logger.o
TESTOBJS = test.o

.PHNOY: uninstall
uninstall:
	-rm /usr/include/log4c.h
	-rm /usr/lib/liblog4c.a

.PHONY: install
install:
	make build
	cp include/log4c.h /usr/include
	cp liblog4c.a /usr/lib

.PHONY: test
test: Makefile
	make test.out
	./test.out

.PHONY: build
build: Makefile
	make liblog4c.a


test.out: Makefile $(TESTOBJS)
	make liblog4c.a
	$(CC) $(CCFLAGS) $(TESTOBJS) -llog4c -o $@

liblog4c.a: Makefile $(OBJS)
	$(AR) $(ARFLAGS) $@ $(OBJS)

%.o: %.c
	$(CC) $(CCFLAGS) -c $^ -o $@

.PHONY: clean
clean:
	-rm *.o
	-rm *.a
	-rm *.out
	-rm *.log