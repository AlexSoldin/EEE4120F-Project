/* ASCIICounter.v Testbench
 Used to test that ASCIICounter.v correcty loops through the letters
 */
module ASCIICounter_tb();
    
    /* Registers and wires used to intreface with ASCIICounter */
    reg clk;
    reg enable;
    reg[7:0] startingPosition;
    reg[2:0] increment;
    reg ready;
    wire[7:0] password;
    wire wrap;
    
    /* ASCIICounter Initialisation */
    ASCIICounter a0(clk, enable, startingPosition, increment, ready, password, wrap); 
    
    /* steps through the first few letters and increments for 55 repetitions */
    initial begin
        $display("Password (Hex)\tPassword\tWrap");
        $monitor("%h\t\t%s\t\t%d",password,password, wrap);
        clk              <= 0;
        ready            <= 1;
        enable           <= 1;
        startingPosition <= 1'h0;
        increment        <= 1;
        
        #5
        clk = ~clk;
        clk = ~clk;
        
        #5
        startingPosition <= 24;
        clk = ~clk;
        
        #5
        clk = ~clk;
        startingPosition <= 25;
        clk = ~clk;
        
        #5
        clk = ~clk;
        startingPosition <= 26;
        clk = ~clk;
        
        repeat (55)
        begin
            increment <= 1;
            #5 clk = ~clk;
        end
        $finish;
    end
    
endmodule
