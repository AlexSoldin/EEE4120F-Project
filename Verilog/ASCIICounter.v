module ASCIICounter(
    input clock,
    input enable,
    input [7:0] startingPosition, //starting letter
    input [2:0] increment, //skip by how many letters
    output reg[7:0] password, //letter to return in ASCII
    output reg wrap //go back to  a from z
);

reg previousRun = 0;
reg [7:0] counter = 0;
reg [7:0] temp = "a";

initial 
    temp = temp + startingPosition;

always @(posedge clock) begin
    if (enable) begin
        if (previousRun == 0) begin
            previousRun <= 1;
            counter <= startingPosition;
            temp <= "a" + counter;         
        end
        else if (counter + increment < 26) begin
            temp <= temp + increment;
            counter <= counter + increment;
            wrap <= 0;
        end
        else begin
            counter <= startingPosition;
            temp <= "a" + counter;
            wrap <= 1;
        end
    end

    if (previousRun == 0) begin
        wrap <= 0;
        temp <= "a";
    end
    password <= temp;
end

endmodule