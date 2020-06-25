/*
Counts from 'a' to 'z' using ASCII values.
When 'z' is reached, the wrap variable is set which is used to enable other ASCIICounter modules used for brute force algorithm
*/
module ASCIICounter(
    input clock,
    input enable,
    input [7:0] startingPosition, //starting letter position
    input [2:0] increment, //amount to incremenet the letters
    input ready,
    output reg[7:0] outputLetter, //letter to return in ASCII
    output reg wrap //wrap from z back to a
);

/* 
Indicates whether or not the module has been run. 
The output must remain in its starting state until first enabled. 
*/
reg previousRun = 0;
/*
A counter from 0 to 25.
Used to determine if wrap needs to be set
*/
reg [7:0] counter = 0;
/*
A placeholder for the actual outputLetter.
Counts from a to z in steps specified by the increment variable
*/
reg [7:0] temp = 8'b0;

initial 
    temp <= startingPosition;

always @(posedge clock) begin
    if (enable && ready) begin
        // Maintains the output in reset state until enabled for the first time
        if (previousRun == 0) begin
            previousRun <= 1;
            counter <= startingPosition;
            temp <= "a" + counter;         
        end
        // Apply the increment as wrap around has not occured
        else if (counter + increment < 26) begin
            temp <= temp + increment;
            counter <= counter + increment;
            wrap <= 0;
        end
        else begin
            counter <= startingPosition;
            temp <= "a" + counter;
        end
        // Wrap around has occured 
        if((counter + increment) > 26)begin
            wrap <= 1; //wrap around to a if we reach z
            temp <= "a";
            counter <= 0;
        end
    end
    
    // Maintains the output in reset state until enabled for the first time
    if (previousRun == 0) begin
        wrap <= 0;
        temp <= "a";
    end
    outputLetter <= temp;
end

endmodule