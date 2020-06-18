module MD5Controller_tb();

reg clk;

reg [2:0] increment;
reg [7:0] startingPosition;
reg [127:0] target_hash;
wire enable; //drives driver and other modules
wire hashes_equal;
wire [127:0] hashed_password;
wire[127:0] plaintext;

initial begin
    
    clk <=0;
    startingPosition <= "a";
    increment <= 3'b001;
    target_hash <= 127'h2db1850a4fe292bd2706ffd78dbe44b9; //vader

    $display("\n    Password Hexadecimal\t\t       Password String");
    $monitor("%d\t%d\t%d\t%d\t%h",enable, MD5Controller.reset,hashes_equal,MD5Controller.guess_to_compare, hashed_password);


    repeat(1000) begin
        #5 clk = ~clk;
    end
    

end

endmodule