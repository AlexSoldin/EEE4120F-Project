module Comparator(
    input [127:0] target_hash;      // hash of the password being guessed
    input [127:0] test_hash;        // hash of the guess
    input test_en;                  // 1 if test is valid, 0 if invalid
    input clk;                      // system clock
    output hashes_equal;            // 1 if target ha
);

endmodule // Comparator