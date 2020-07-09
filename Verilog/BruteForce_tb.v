/* BruteForce.v Testbench
 Used to test that BruteForce.v forms strings
 */
module BruteForce_tb();
    
    /* Registers and wires used to intreface with BruteForce */
    reg clk;
    reg enable;
    reg [7:0] startingPosition;
    reg [2:0] increment;
    wire [127:0] password;
    reg ready;
    wire [0:7] numCharacters;
    
    /* BruteForce initialisation */
    BruteForce bf(clk, enable, startingPosition, increment, ready, password, numCharacters);
    
    /* outputs string combinations lexicographically, starting from a*/
    initial begin
        clk              <= 0;
        enable           <= 1;
        ready            <= 1;
        startingPosition <= "a";
        increment        <= 3'b001;
        
        $display("Generated String\tNumber of Characters");
        $monitor("%s\t%d",password, numCharacters);
        
        repeat (100000000)begin
            #5 clk = ~ clk;
        end
    end
    
endmodule
