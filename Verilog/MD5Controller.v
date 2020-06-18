module MD5Controller(
    input clock,
    input [2:0] increment,
    input [7:0] startingPosition,
    input [127:0] target_hash,
    output reg enable, //drives driver and other modules
    output reg hashes_equal,
    output reg [127:0] hashed_pword, //for testing purposes
    output reg [127:0]  plaintext
);

wire reset; //tied to Drive module
wire [127:0] guess;
reg [0:127] word_in; //the word sent to pancham md5 encrypter, max 128
reg [0:7] word_in_width = 128; //endianness to match pancham module
wire msg_in_valid = 0; //boolean value indicating if input word is valid

//outputs of pancham
wire [0:127] hashed_password; //output of encrypter - endianness to match encrypter
wire output_valid; //asserted if output message valid
wire encrypter_ready; //if 1, encrypter is ready for next word

wire equal_valid; //tells us if the output of the comparator is valid or not
wire password_hashes_equal;

reg [0:127] guess_to_compare;

Driver driver(clock, enable, reset);
BruteForce brute(clock, enable, startingPosition, increment, guess); //output of the BruteForce algorithm is our guess
pancham encrypter(clk, reset, word_in, word_in_width, msg_in_valid, hashed_password, output_valid, encrypter_ready);
Comparator comp(target_hash, guess_to_compare, enable, clock, equal_valid, password_hashes_equal);


always @ (posedge reset) begin
    enable <= 0; //pull enable low when reset
end

always @ (posedge clock) begin
    if (reset == 0) begin
        enable <= 1; //enable all modules if reset is low, driver module manages reset
    end
    if (enable == 1) begin
        if(encrypter_ready==1 && hashes_equal==0)begin //is pancham ready for next word
             word_in <= guess; //get the next word
        end
        if(output_valid==1) begin //is the output of pancham valid
            guess_to_compare <= hashed_password; //assign output of encrypter to comparator
            hashed_pword <= hashed_password;
        end
    end//end if enable is 1

    if(hashes_equal)begin
        enable <= 0; //we're done
    end
end //end always

endmodule