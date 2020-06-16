module Comparator_tb();
    
    reg [127:0] target_hash;      // hash of the password being guessed
    reg [127:0] test_hash;        // hash of the guess
    reg test_en;                  // 1 if testing is enabled
    reg clk;                      // system clock
    wire equal_valid;           // 1 if result is valid
    wire hashes_equal;            // 1 if target_hash == test_hash
    
    Comparator uut(target_hash, test_hash, test_en, clk, equal_valid, hashes_equal);
    
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
