/* ASCIICounter.v Testbench */
module top();

reg clk;
reg enable;
reg[7:0] startingPosition;
reg[2:0] increment;
reg ready;
wire[7:0] password;
wire wrap;

ASCIICounter a0(clk, enable, startingPosition, increment, ready, password, wrap);

initial begin
    $display("Password (Hex)\tPassword\tWrap");
    $monitor("%h\t\t%s\t\t%d",password,password, wrap);
    clk <= 0;
    ready <= 1;
    enable <= 1;
    startingPosition <= 1'h0;
    increment <= 1;
    // output <= password;

    #5 
    clk = ~ clk;

    #5
    enable <= 1;
    clk = ~clk;

    #5
    startingPosition <= 24;
    clk = ~clk;

    #5
    clk = ~clk;
    startingPosition <= 25;
    clk = ~clk;

    #5
    clk = ~clk;
    startingPosition <= 26;
    clk = ~clk;

    repeat (55) // <<< NB: may need to depending on n
        begin
            increment <= 1;
            #5 clk = ~clk;
        end
end

endmodule