/* Mux4to1.v
 4-to-1 Multiplexor module
 */
module Mux4to1(input [127:0] in1,       // inputs to multiplexor
               in2,
               in3,
               in4,
               input [1:0] sel,         // used to assign selected input to output
               output reg [127:0] out); // output of multiplexor
/*
 Triggered when any of the inputs change
 assigns output as selected input
 */
always @ (in1 or in2 or in3 or in4 or sel) begin
    case (sel)
        2'b00: out   = in1;
        2'b01: out   = in2;
        2'b10: out   = in3;
        2'b11: out   = in4;
        default: out = 128'bx;
    endcase
end

endmodule //
