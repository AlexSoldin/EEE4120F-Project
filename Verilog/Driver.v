/* Driver.v
 Used to drop reset and start system's operation
 */
module Driver(input clock,       //module clock
              input enable,      //module enable
              output reg reset); //system reset
    /*
     register used to ensure module's operation only occurs once
     */
    reg previousRun = 0;
    /*
     Reset starts high and is set to 0 when MD5Controller is enabled
     */
    initial reset = 1;
    /*
     On startup, drop reset
     */
    always @(posedge clock, enable) begin
        if (clock == 1 && enable == 1 && previousRun == 0) begin
            reset       <= 0;
            previousRun <= 1;
        end
    end
    
endmodule
