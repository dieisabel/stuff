SHELL = /usr/bin/env bash

MMCU          = atmega328p
CPU_FREQUENCY = 16000000UL
UPLOADER      = avrdude
PROGRAMMER    = usbasp
PORT          =
BAUD_RATE     = 9600

SRC = src
OBJ = obj
BIN = bin
LIB = lib
INC = include

CC     = avr-gcc
CFLAGS = \
-Wall \
-std=c11 \
-Os \
-mmcu=$(MMCU) \
-DF_CPU=$(CPU_FREQUENCY) \
$(INCLUDES)
OBJCOPY  = avr-objcopy
SECTIONS = text data

LIBS = \
-L $(LIB)
INCLUDES = \
-I $(INC)

FILENAME   = main
EXECUTABLE = $(BIN)/$(FILENAME).elf
FIRMWARE   = $(BIN)/$(FILENAME).hex

SOURCES = \
$(SRC)/main.c

OBJECTS = \
$(OBJ)/main.o

define HELP_BODY
- build: compile, link and copy sections into firmware
- compile: compile source files into object files
- upload: upload firmware to a microcontroller
- clean: clean created files
- help: show help
endef
export HELP_BODY

.PHONY: help
default: build upload

build: compile | $(BIN)
	@echo "Linking all object files into $(EXECUTABLE) executable"
	@$(CC) $(CFLAGS) $(OBJECTS) $(LIBS) -o $(EXECUTABLE)
	@echo "Copying $(foreach section, $(SECTIONS),.$(section)) sections into $(FIRMWARE)"
	@$(OBJCOPY) $(foreach section, $(SECTIONS), -j .$(section)) \
		-O ihex $(EXECUTABLE) $(FIRMWARE)

upload:
	@echo "Uploading firmware to $(PORT) using $(PROGRAMMER)"
	@$(UPLOADER) -p $(MMCU) -c $(PROGRAMMER) -P $(PORT) \
		-b $(BAUD_RATE) -U flash:w:$(FIRMWARE):i
	@echo "Finished uploading"

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
