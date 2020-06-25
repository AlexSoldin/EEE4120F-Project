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
    startingPosition <= "a";
    increment <= 3'b001;
    target_hash <= 127'h5014bf4efb93a883b348004c9b90ddc6; //akha 

     
    $display("\nEnable  Reset  hashes_eq   guess_to_comp    hashed_pword    pancham_ready   output_valid  word Length");
    $monitor("%d\t%d\t%d\t%s\t%h\t%d\t%d\t%d",enable, uut.reset,hashes_equal,uut.guess, uut.hashed_password, uut.encrypter_ready, uut.output_valid, uut.word_in_width);


    repeat(100000000) begin
        #10 clk = ~clk;
    end

end

endmodule