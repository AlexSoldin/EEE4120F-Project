module BruteForce(
    input clock,
    input enable,
    input [7:0] startingPosition, //starting letter position
    input [2:0] increment, //amount of letters to increment by
    output reg[7:0] wordLength,
    output reg[127:0] password //the output password
);

wire e0, e1, e2, e3, e4, e5, e6;
wire[127:0] tempPassword;
reg[127:0] finalPassword;//allows for a 16 byte long character string

ASCIICounter a0(clock, enable, startingPosition, increment, tempPassword[7:0], e0);
/*
The clock of a1 is the speed of toggle of the wrap bit of a0
*/
ASCIICounter a1(e0, enable, startingPosition, increment, tempPassword[15:8], e1); 
/*
The clock of a2 is the speed of toggle of the wrap bit of a1
*/
ASCIICounter a2(e1, enable, startingPosition, increment, tempPassword[23:16], e2); 
/*
The clock of a3 is the speed of toggle of the wrap bit of a2
*/
ASCIICounter a3(e2, enable, startingPosition, increment, tempPassword[31:24], e3); 
/*
The clock of a4 is the speed of toggle of the wrap bit of a3
*/
ASCIICounter a4(e3, enable, startingPosition, increment, tempPassword[39:32], e4); 
/*
The clock of a5 is the speed of toggle of the wrap bit of a4
*/
ASCIICounter a5(e4, enable, startingPosition, increment, tempPassword[47:40], e5); 
/*
The clock of a6 is the speed of toggle of the wrap bit of a5
*/
ASCIICounter a6(e5, enable, startingPosition, increment, tempPassword[55:48], e6); 
/*
The clock of a7 is the speed of toggle of the wrap bit of a6
*/
ASCIICounter a7(e6, enable, startingPosition, increment, tempPassword[63:56], e7); 


always @(posedge clock) begin
   
    if (enable==1) begin
        password <= {tempPassword[63:56], tempPassword[55:48], tempPassword[47:40], tempPassword[39:32], tempPassword[31:24], tempPassword[23:16],tempPassword[15:8], tempPassword[7:0]};
    end //end if

end
endmodule