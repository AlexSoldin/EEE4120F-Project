/* Comparator.v Testbench
 Used to test that Comparator.v correctly tests for equality
 */
module Comparator_tb();
    /*
     Wires and registers used to interface with comparator
     */
    reg [127:0] target_hash;
    reg [127:0] test_hash;
    reg test_en;
    reg clk;
    wire equal_valid;
    wire hashes_equal;
    
    /*
     Instantiation of comparator
     */
    Comparator uut(target_hash, test_hash, test_en, clk, equal_valid, hashes_equal);
    /*
     Tests output of comparator to correctly idetify equal and non-equal hashes
     */
    initial begin
        $display("Test Enabled\tTarget\t\t\t\t\tTest\t\t\t\t\tEqual\tRes Valid");
        $monitor("%d\t\t%h\t%h\t%d\t%d",test_en,target_hash,test_hash,hashes_equal,equal_valid);
        
        clk         <= 0;
        test_en     <= 0;
        target_hash <= 128'hd3fa46720655e414eba34eff76a4106e;
        test_hash   <= 128'h1;
        
        #5 clk = ~clk;
        #5 clk = ~clk;
        
        test_en <= 1;
        
        #5 clk = ~clk;
        #5 clk = ~clk;
        
        test_en     <= 0;
        target_hash <= 128'hd3fa46720655e414eba34eff76a4106e;
        test_hash   <= 128'hd3fa46720655e414eba34eff76a4106e;
        
        #5 clk = ~clk;
        #5 clk = ~clk;
        
        test_en <= 1;
        
        #5 clk = ~clk;
        #5 clk = ~clk;
        
        test_en     <= 0;
        target_hash <= 128'hcd3542249e4323fd902046f20d457a48;
        test_hash   <= 128'h1;
        
        #5 clk = ~clk;
        #5 clk = ~clk;
        
        test_en <= 1;
        
        #5 clk = ~clk;
        #5 clk = ~clk;
        
        test_en     <= 0;
        target_hash <= 128'hcd3542249e4323fd902046f20d457a48;
        test_hash   <= 128'hcd3542249e4323fd902046f20d457a48;
        
        #5 clk = ~clk;
        #5 clk = ~clk;
        
        test_en <= 1;
        
        #5 clk = ~clk;
        #5 clk = ~clk;
        
        test_en <= 0;
        
        #5 clk = ~clk;
        #5 clk = ~clk;
        
    end
endmodule // Comparator_tb
