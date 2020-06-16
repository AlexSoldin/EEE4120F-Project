module Comparator(input [127:0] target_hash, // hash of the password being guessed
                  input [127:0] test_hash,   // hash of the guess
                  input test_en,             // 1 if testing is enabled
                  input clk,                 // system clock
                  output reg equal_valid,    // 1 if result is valid
                  output reg hashes_equal);  // 1 if target_hash == test_hash
    
    always @ (posedge clk) begin
        if (test_en == 1) begin
            if (test_hash == target_hash) begin
                hashes_equal <= 1'b1;
                equal_valid  <= 1'b1;
                end else begin
                hashes_equal <= 1'b0;
                equal_valid  <= 1'b1;
            end
            end else equal_valid <= 1'b0;
        end
        
        endmodule // Comparator
