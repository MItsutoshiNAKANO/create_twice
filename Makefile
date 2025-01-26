#! /usr/bin/make -f

##
# @file
# @brief Makefile.
# @date 2025
# @copyright
#   Mitsutoshi Nakano <ItSANgo@gmail.com>
#   SPDX-License-Identifier: MIT

TARGETS=create_twice

create_twice_ECPG_SRCS=create_twice.pgc sql_error.pgc
create_twice_HEADERS=sql_error.h

create_twice_OBJS=$(create_twice_ECPG_SRCS:.pgc=.o)
create_twice_CS=$(create_twice_ECPG_SRCS:.pgc=.c)

ECPG=ecpg
CFLAGS=-Wall -Wextra -Werror -std=c2x -Wpedantic -I/usr/include/postgresql
LIBS=-lecpg
FORMAT=clang-format -i

.PHONY: all format clean
.SUFFIXES: .o .c .pgc .h

all: $(TARGETS)
create_twice: $(create_twice_OBJS)
	$(CC) -o create_twice $(create_twice_OBJS) $(LIBS)
$(create_twice_OBJS): $(create_twiceHEADERS)
%.c: %.pgc
	$(ECPG) -o $@ $<
format:
	$(FORMAT) $(FORMAT_FLAGS) $(create_twice_ECPG_SRCS) $(create_twice_HEADERS)
clean:
	$(RM) $(TARGETS) $(create_twice_OBJS) $(create_twice_CS)
