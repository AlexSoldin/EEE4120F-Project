PROG = BruteForce_tb
CC = iverilog

$(PROG): $(PROG).v BruteForce.v ASCIICounter.v
	$(CC) -o $(PROG) $(PROG).v BruteForce.v ASCIICounter.v

run:
	./$(PROG)

clean:
	rm $(PROG)