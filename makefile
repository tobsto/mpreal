INSTALL_DIR=/usr/local
INCLUDE_DIR=$(INSTALL_DIR)/include
LIB_DIR=$(INSTALL_DIR)/lib
CC=g++ -I $(INCLUDE_DIR) -L $(LIB_DIR)

make: mpreal.o dlmalloc.o
	$(CC) -c -fPIC dlmalloc.c mpreal.cpp 
	$(CC) -shared -o libmpreal.so dlmalloc.o mpreal.o

install: mpreal.o dlmalloc.o
	$(CC) -c -fPIC dlmalloc.c mpreal.cpp 
	$(CC) -shared -o libmpreal.so dlmalloc.o mpreal.o
	cp mpreal.h $(INSTALL_DIR)/include/
	cp libmpreal.so $(INSTALL_DIR)/lib/

mpreal.o: mpreal.cpp mpreal.h
	$(CC) -c mpreal.cpp

dlmalloc.o: dlmalloc.c dlmalloc.h
	$(CC) -c dlmalloc.c

clean:
	rm -f *.o 

