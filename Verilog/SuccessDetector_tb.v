module SuccessDetector_tb(
    
);

reg cracker1, cracker2, cracker3, cracker4;
reg clk;
wire [1:0] successfulCracker;
wire success;

SuccessDetector uut (cracker1, cracker2, cracker3, cracker4, clk, successfulCracker, success);

initial begin
    $display("Cracker 1\tCracker 2\tCracker 3\tCracker 4\tSuccess\tCracker");
    $monitor("%b\t\t%b\t\t%b\t\t%b\t\t%b\t%b",cracker1, cracker2, cracker3, cracker4, success, successfulCracker);
    cracker1 <= 0;
    cracker2 <= 0;
    cracker3 <= 0;
    cracker4 <= 0;
    clk <= 0;
    
    #5 clk = ~clk;
    #5 clk = ~clk;

    cracker1 <= 1;
    #5 clk = ~clk;
    #5 clk = ~clk;
    cracker1 <= 0;
    #5 clk = ~clk;
    #5 clk = ~clk;
    cracker2 <= 1;
    #5 clk = ~clk;
    #5 clk = ~clk;
    cracker2 <= 0;
    #5 clk = ~clk;
    #5 clk = ~clk;
    cracker3 <= 1;
    #5 clk = ~clk;
    #5 clk = ~clk;
    cracker3 <= 0;
    #5 clk = ~clk;
    #5 clk = ~clk;
    cracker4 <= 1;
    #5 clk = ~clk;
    #5 clk = ~clk;
    cracker4 <= 0;
    #5 clk = ~clk;
    #5 clk = ~clk;
end

endmodule // SuccessDetector_tb