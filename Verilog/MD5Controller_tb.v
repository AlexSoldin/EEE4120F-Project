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
    target_hash <= 127'h2db1850a4fe292bd2706ffd78dbe44b9; //vader 

     
    $display("\nEnable  Reset  hashes_eq   guess_to_comp    hashed_pword    pancham_ready   output_valid ");
    $monitor("%d\t%d\t%d\t%d\t%h\t%d\t%d",enable, uut.reset,hashes_equal,uut.guess_to_compare, hashed_password, uut.encrypter_ready, uut.output_valid);


    repeat(100000) begin
        #5 clk = ~clk;
    end
    

end

endmodule