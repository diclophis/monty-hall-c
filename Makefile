# OSX Makefile

CXXFLAGS=\
-m64 \
-Wall \
-g \
-pg \
-I/usr/include \

CFLAGS=$(CXXFLAGS)
LDFLAGS=-m64 -arch x86_64

objects   = $(patsubst %,build/%, $(patsubst %.c,%.o, $(wildcard *.c)))

build/play: build/monty-hall
	build/monty-hall

build/monty-hall: build $(objects)
	$(CC) $(LDFLAGS) -o build/monty-hall $(objects)

build/%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

build:
	mkdir -p build

clean:
	touch build && rm -R build
