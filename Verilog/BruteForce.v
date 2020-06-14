module BruteForce(
    input clock,
    input enable,
    input [7:0] startingPosition, //starting letter
    input [2:0] increment, //amount of letters to increment by
    output reg[7:0] wordLength,
    output reg[127:0] password //the output password
);

wire e0, e1, e2, e3, e4, e5, e6;
wire[127:0] tempPassword;
reg[127:0] finalPassword;//allows for a 16 byte long character string

ASCIICounter a0(clock, enable, startingPosition, increment, tempPassword[7:0], e0);
ASCIICounter a1(e0, enable, startingPosition, increment, tempPassword[15:8], e1); //clock is the speed of toggle of the wrap bit of previous counter
ASCIICounter a2(e1, enable, startingPosition, increment, tempPassword[23:16], e2); //clock is the speed of toggle of the wrap bit of previous counter


always @(posedge clock) begin
   
    if (enable==1) begin
        password <= {tempPassword[23:16],tempPassword[15:8], tempPassword[7:0]};
    end //end if

end
endmodule