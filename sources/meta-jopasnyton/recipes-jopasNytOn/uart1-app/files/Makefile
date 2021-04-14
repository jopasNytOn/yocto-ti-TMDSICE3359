CROSS_COMPILE ?=
CC ?= $(CROSS_COMPILE)gcc
CXX ?= $(CROSS_COMPILE)g++

SRCS=uart1-app.c
OBJS=$(subst .c,.o,$(SRCS))

all: uart1-app

uart1-app: $(OBJS)
	$(CC) $(LDFLAGS) -o uart1-app $(OBJS) $(LDLIBS)

clean:
	$(RM) $(OBJS)

distclean: clean
	$(RM) uart1-app

