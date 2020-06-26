module BruteForce_tb();

reg clk;
reg enable;
reg [7:0] startingPosition;
reg [2:0] increment;
wire [127:0] password;
reg ready; //when controller module is ready, give it a password
wire [0:7] numCharacters;

BruteForce bf(clk, enable, startingPosition, increment, ready, password, numCharacters);

initial begin
    clk <= 0;
    enable <= 1;
    ready <= 1;
    startingPosition <= "a";
    increment <= 3'b001;
  
    $display("Generated String\tNumber of Characters");
    $monitor("%s\t%d",password, numCharacters);

    repeat (100000000)begin
         #5 clk = ~ clk;
    end
end

endmodule