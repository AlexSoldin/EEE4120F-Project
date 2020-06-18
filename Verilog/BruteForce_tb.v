module BruteForce_tb();

reg clk;
reg enable;
reg [7:0] startingPosition;
reg [2:0] increment;
wire [127:0] password;

BruteForce bf(clk, enable, startingPosition, increment, password);

initial begin
    clk <= 0;
    enable <= 1;
    startingPosition <= "a";
    increment <= 3'b001;
  
    $display("\n    Password Hexadecimal\t\t       Password String");
    $monitor("%h\t%s",password,password);

    repeat (100000000)begin
         #5 clk = ~ clk;
    end
end

endmodule