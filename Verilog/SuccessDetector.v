module SuccessDetector(
    input cracker1, cracker2, cracker3, cracker4,
    input clk,
    output reg [1:0] successfulCracker,
    output reg success
);

always @ (posedge clk) begin
    if (cracker1 == 1'b1) begin
        successfulCracker <= 1'b00;
        success <= 1;
    end else if (cracker2 == 1'b1) begin
        successfulCracker <= 1'b01;
        success <= 1;
    end else if (cracker3 == 1'b1) begin
        successfulCracker <= 1'b10;
        success <= 1;
    end else if (cracker4 == 1'b1 begin
        successfulCracker <= 1'b11;
        success <= 1;
    end else begin
        success <= 0;
    end
end

endmodule // SuccessDetector