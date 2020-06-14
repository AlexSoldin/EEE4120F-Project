PROG = top
CC = iverilog

$(PROG): top.v ASCIICounter.v
	$(CC) -o $(PROG) top.v ASCIICounter.v

run:
	./$(PROG)

clean:
	rm $(PROG)