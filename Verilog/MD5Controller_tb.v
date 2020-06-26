module MD5Controller_tb();

reg clk;
reg [2:0] increment;
reg [7:0] startingPosition;
reg [127:0] target_hash;
wire enable; //drives driver and other modules
wire hashes_equal;
wire [127:0] hashed_password;
wire[127:0] plaintext;

MD5Controller uut(clk, increment, startingPosition, target_hash, enable, hashes_equal, hashed_password, plaintext);

initial begin
    
    clk <= 0;
    startingPosition <= "a";//
    increment <= 3'b001;
    // lex_hash = 128'hc17f30f7bac12b15413c3a99b5e6082b;
    // akha_hash = 128'hdbf1f9387391a61af6b9e429722b9447;
    // vader_hash = 128'hcd3542249e4323fd902046f20d457a48;
    // coffee_hash = 128'hb88883a94d21d9310ff3a8fd83e1df59;
    // jackson_hash = 128'h605b2f998435b565c56bf7d5a1a9b83e;
    target_hash = 128'hc17f30f7bac12b15413c3a99b5e6082b;
    $display("\nEnable\tReset\tHashes Equal\tGuess\tHashed Guess\t\t\tEncrpter Ready\tOutput Valid\tGuess Length");
    $monitor("%d\t%d\t%d%s\t%h\t%d\t%d\t\t%d",enable, uut.reset,uut.password_hashes_equal,uut.word_in, uut.hashed_password, uut.encrypter_ready, uut.output_valid, uut.word_in_width);


    repeat(100000000) begin
        #10 clk = ~clk;
    end

end

endmodule