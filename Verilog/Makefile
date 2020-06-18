PROG = BruteForce_tb
CC = iverilog

$(PROG): $(PROG).v BruteForce.v ASCIICounter.v
	$(CC) -o $(PROG) $(PROG).v BruteForce.v ASCIICounter.v pancham.v pancham_round.v

run:
	./$(PROG)

clean:
	rm $(PROG)
	rm MD5Controller_tb
	rm comparator_tb

comparator_tb: Comparator_tb.v Comparator.v
	iverilog -o comparator_tb Comparator.v Comparator_tb.v

run_comparator_tb:
	./comparator_tb

clean_comparator_tb:
	rm comparator_tb

MD5Controller_tb: MD5Controller_tb.v MD5Controller.v
	iverilog -o MD5Controller_tb MD5Controller.v MD5Controller_tb.v Driver.v ASCIICounter.v BruteForce.v pancham.v pancham_round.v Comparator.v

run_MD5_tb:
	./Md5Controller_tb



