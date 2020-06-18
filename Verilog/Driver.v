module Driver(
    input clock,
    input enable,
    output reg reset
);

reg previousRun = 0;
/*
Reset starts high and is set to 0 when MD5Controller is enabled
*/
initial reset = 0;

always @(posedge clock, enable) begin
    if (clock == 1 && enable == 1 && previousRun == 0) begin
        reset <= 0;
        previousRun <= 1;
    end
end

endmodule