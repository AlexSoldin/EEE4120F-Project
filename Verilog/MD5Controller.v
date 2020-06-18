module MD5Controller(
    input clock,
    input [2:0] increment,
    input [7:0] startingPosition,
    input [127:0] target_hash,
    output reg enable, //drives driver and other modules
    output reg hashes_equal,
    output [127:0] reg plaintext
);

reg reset; //tied to Drive module
reg [127:0] guess;
reg [0:127] word_in; //the word sent to pancham md5 encrypter, max 128
reg [0:7] word_in_width = 128; //endianness to match pancham module
reg msg_in_valid = 0; //boolean value indicating if input word is valid

//outputs of pancham
reg [0:127] hashed_password; //output of encrypter - endianness to match encrypter
reg output_valid; //asserted if output message valid
reg encrypter_ready; //if 1, encrypter is ready for next word



Driver driver(clock, enable, reset);
BruteForce brute(clock, enable, startingPosition, increment, guess); //output of the BruteForce algorithm is our guess
pancham encrypter(clk, reset, word_in, word_in_width, msg_in_valid, hashed_password, output_valid, encrypter_ready);



always @ (posedge reset) begin
    enable <= 0; //pull enable low when reset
end


endmodule