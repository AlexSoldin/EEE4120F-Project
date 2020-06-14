module BruteForce(
    input clock,
    input enable,
    input [2:0] startingPosition,
    input [2:0] increment,
    output reg[7:0] wordLength,
    output reg[127:0] password
);

reg e0, e1, e2, e3, e4, e5, e6;
reg[127:0] tempPassword = 128'00000000000000000000000000000000;;
reg[127:0] finalPassword = 128'00000000000000000000000000000000;

ASCIICounter a0(clock, enable, startingPosition, increment, tempPassword[7:0], e0);