TARGET=sample1
C_SRCFILES=main.c expressionParser.c sample1.c
OBJ_FILES=${C_SRCFILES:.c=.o}

.PHONY: clean

$(TARGET): $(OBJ_FILES)
	gcc -o $@ $(OBJ_FILES)

sample1.c: sample1.l
	flex -o $@ $^

%.o: %.c tokens.h
	gcc -c -o $@ $<

run: $(TARGET)
	./$(TARGET) < input1.txt

clean:
	rm -f sample1.c
	rm -f sample1
