/* SuccessDetector.v Testbench
 used to test that SuccessDetector correctly identifies which controller achieved the correct output
 */
module SuccessDetector_tb();
    
    reg controller1, controller2, controller3, controller4;
    reg clk;
    wire [1:0] successfulController;
    wire success;
    
    SuccessDetector uut (controller1, controller2, controller3, controller4, clk, successfulController, success);
    
    initial begin
        $display("Controller 1\tController 2\tController 3\tController 4\tSuccess\tController");
        $monitor("%b\t\t%b\t\t%b\t\t%b\t\t%b\t%b",controller1, controller2, controller3, controller4, success, successfulController);
        controller1 <= 0;
        controller2 <= 0;
        controller3 <= 0;
        controller4 <= 0;
        clk         <= 0;
        
        #5 clk = ~clk;
        #5 clk = ~clk;
        
        controller1 <= 1;
        #5 clk = ~clk;
        #5 clk = ~clk;
        controller1 <= 0;
        #5 clk = ~clk;
        #5 clk = ~clk;
        controller2 <= 1;
        #5 clk = ~clk;
        #5 clk = ~clk;
        controller2 <= 0;
        #5 clk = ~clk;
        #5 clk = ~clk;
        controller3 <= 1;
        #5 clk = ~clk;
        #5 clk = ~clk;
        controller3 <= 0;
        #5 clk = ~clk;
        #5 clk = ~clk;
        controller4 <= 1;
        #5 clk = ~clk;
        #5 clk = ~clk;
        controller4 <= 0;
        #5 clk = ~clk;
        #5 clk = ~clk;
    end
    
endmodule // SuccessDetector_tb
