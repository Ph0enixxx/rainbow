CC      = gcc
CFLAGS  = -Wall -Wextra -Werror -pedantic -std=c99 -O3 -D_XOPEN_SOURCE=600 -g
LDFLAGS = -O3 -lm -lpthread
TARGETS = rtgen rtcrack rtkey

all: $(TARGETS)

rt%: rt%.o md5.o rainbow.o
	@mkdir -p $(@D)
	$(CC) $(LDFLAGS) $^ -o $@

%.o: %.c
	@mkdir -p $(@D)
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f *.o

destroy: clean
	rm -f $(TARGETS)

rebuild: destroy all
