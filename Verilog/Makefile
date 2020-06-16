PROG = BruteForce_tb
CC = iverilog

$(PROG): $(PROG).v BruteForce.v ASCIICounter.v
	$(CC) -o $(PROG) $(PROG).v BruteForce.v ASCIICounter.v

run:
	./$(PROG)

clean:
	rm $(PROG)

comparator_tb: Comparator_tb.v Comparator.v
	iverilog -o comparator_tb Comparator.v Comparator_tb.v

run_comparator_tb:
	./comparator_tb

clean_comparator_tb:
	rm comparator_tb