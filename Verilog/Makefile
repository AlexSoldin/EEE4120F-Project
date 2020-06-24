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

clean_MD5_tb:
	rm Md5Controller_tb

mux4to1_tb: Mux4to1_tb.v Mux4to1.v
	iverilog -o mux4to1_tb Mux4to1.v Mux4to1_tb.v

run_mux4to1_tb:
	./mux4to1_tb

clean_mux4to1_tb:
	rm mux4to1_tb

successdetector_tb: SuccessDetector_tb.v SuccessDetector.v
	iverilog -o successdetector_tb SuccessDetector.v SuccessDetector_tb.v

run_successdetector_tb:
	./successdetector_tb

clean_successdetector_tb:
	rm successdetector_tb

pancham_tb: pancham.v pancham_round.v pancham_tb.v
	iverilog -o pancham_tb pancham.v pancham_round.v pancham_tb.v 

run_pancham_tb:
	./pancham_tb

clean_pancham_tb:
	rm pancham_tb
