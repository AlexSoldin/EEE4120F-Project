/* SuccessDetector.v
 used to determine which MD5Controller had a successful test
 */
module SuccessDetector(input controller1,                     // inputs are hashes_equal output from each MD5Controller
                       controller2,
                       controller3,
                       controller4,
                       input clk,                             // module clock
                       output reg [1:0] successfulController, // outputs which controller was successful
                       output reg success);                   // raises success when a controller is successful
    
    always @ (posedge clk) begin
        if (controller1 == 1'b1) begin
            successfulController <= 2'b00;
            success              <= 1;
            end else if (controller2 == 1'b1) begin
            successfulController <= 2'b01;
            success              <= 1;
            end else if (controller3 == 1'b1) begin
            successfulController <= 2'b10;
            success              <= 1;
            end else if (controller4 == 1'b1) begin
            successfulController <= 2'b11;
            success              <= 1;
            end else begin
            success <= 0;
        end
    end
    
endmodule // SuccessDetector
