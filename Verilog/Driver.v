module Driver(
    input clock,
    input enable,
    output reset
);

reg previousRun = 0;
/*
Reset starts high
*/
initial reset = 1;

always @(posedge clock, enable) begin
    if (clock == 1 && enable == 1 && previousRun == 0) begin
        reset <= 1;
        previousRun <= 1;
    end
end

endmodule