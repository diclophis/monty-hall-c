# OSX Makefile

CXXFLAGS=\
-Wall

#-O3
#-funroll-all-loops \
#-fprofile-use

CFLAGS=$(CXXFLAGS)
LDFLAGS=
#-m64

objects = $(patsubst %,build/%, $(patsubst %.c,%.o, $(wildcard *.c)))

build/play: build/monty-hall

build/monty-hall: build $(objects)
	$(CC) $(LDFLAGS) -o build/monty-hall.js $(objects)

build/%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

build:
	mkdir -p build

clean:
	touch build && rm -R build
