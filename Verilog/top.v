/* ASCIICounter.v Testbench */
// module top();

// reg clk;
// reg enable;
// reg[2:0] startingPosition;
// reg[2:0] increment;
// wire[7:0] password;
// wire wrap;

// ASCIICounter a0(clk, enable, startingPosition, increment, password, wrap);

// initial begin
//     $display("Password\tPassword\tWrap");
//     $monitor("%h\t\t%s\t\t%d",password,password, wrap);
//     clk <= 0;
//     enable <= 1;
//     startingPosition <= 1'h0;
//     increment <= 1;
//     // output <= password;

//     #5 
//     clk = ~ clk;

//     #5
//     enable <= 1;
//     clk = ~clk;

//     #5
//     startingPosition <= 24;
//     clk = ~clk;

//     #5
//     clk = ~clk;
//     startingPosition <= 25;
//     clk = ~clk;

//     #5
//     clk = ~clk;
//     startingPosition <= 26;
//     clk = ~clk;

//     repeat (60) // <<< NB: may need to depending on n
//         begin
//             increment <= 1;
//             #5 clk = ~clk;
//         end
// end

// endmodule

/* Brute Force Testbench */
module top();

endmodule