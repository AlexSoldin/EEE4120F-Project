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
    
    clk <=0;
    startingPosition <= "a";
    increment <= 3'b001;
    target_hash <= 127'h2db1850a4fe292bd2706ffd78dbe44b9; //vader


    $display("\nEnable\tHashes Equal?\tHashed Password");
    $monitor("%d\t  %d\t\t%h",enable,hashes_equal, hashed_password);


    repeat(10000) begin
        #1 clk = ~clk;
    end
    

end

endmodule