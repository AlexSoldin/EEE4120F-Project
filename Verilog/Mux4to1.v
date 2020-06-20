module Mux4to1(
    input wire in1, in2, in3, in4,
    input wire [1:0] sel,
    output reg out
);

always @ (in1 or in2 or in3 or in4) begin
    case (sel)
        2'b00: out = in1;
        2'b01: out = in2;
        2'b10: out = in3;
        2'b11: out = in4; 
        default: out = 1'bx;
    endcase
end

endmodule // 