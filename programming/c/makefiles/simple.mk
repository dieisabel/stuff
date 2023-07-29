SHELL := /usr/bin/env bash

SRC := src
OBJ := obj
BIN := bin
LIB := lib
INC := include

LIBS     := -L $(LIB)
INCLUDES := -I $(INC)
CC       := gcc
CFLAGS   := -Wall -Wextra -std=c11 -g -O0 $(INCLUDES)

FILENAME   := main
EXECUTABLE := $(BIN)/$(FILENAME).elf

SOURCES := \
$(SRC)/main.c

OBJECTS := \
$(OBJ)/main.o

define HELP_BODY
- build: compile, link
- compile: compile source files into object files
- run: run application
- clean: clean object files and executable
- help: show help
endef
export HELP_BODY

.PHONY: help
default: build run

build: compile | $(BIN)
	@echo "Linking all object files into $(EXECUTABLE) executable"
	@$(CC) $(CFLAGS) $(OBJECTS) $(LIBS) -o $(EXECUTABLE)

run: $(EXECUTABLE)
	@echo "Running $(EXECUTABLE)"
	@./$<

compile: $(OBJECTS)

help:
	@echo "$$HELP_BODY"

clean:
	@echo "Cleaning object files and $(EXECUTABLE) executable"
	@rm $(OBJECTS) $(EXECUTABLE)

$(OBJECTS): | $(OBJ)

$(OBJ)/%.o: $(SRC)/%.c
	@echo "Compiling $< into $@"
	@$(CC) -c $(CFLAGS) -o $@ $<

$(OBJ):
	@echo "Creating $(OBJ) directory for object files"
	@mkdir -p $(OBJ)

$(BIN):
	@echo "Creating $(BIN) directory for binary files"
	@mkdir -p $(BIN)
