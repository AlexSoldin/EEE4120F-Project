module BruteForce_tb();
//module top();

reg enable;
reg [7:0] startingPosition;
reg [2:0] increment;
wire [7:0] wordLength;
wire [127:0] password;

BruteForce bf(CLK100MHZ, enable, startingPosition, increment, wordLength, password);
//integer count = 0;
initial begin
  
    enable <= 1;
    startingPosition <= "a";
    increment <= 1;
  
    $display("Password");
    $monitor("%h\t\t%s",password,password);
end

endmodule