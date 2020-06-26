/* MD5Controller.v
 Main module of VADER
 Combines other modules to achieve cracking functionality
 */
module MD5Controller(input clock,                     //module clock
                     input [2:0] increment,           //number of letters to increment by
                     input [0:7] startingPosition,    //starting letter
                     input [0:127] target_hash,       //hash for password we're trying to recover
                     output reg enable,               //drives driver and other modules
                     output reg hashes_equal = 0,     //bit raised when hashes are equal
                     output reg [0:127] hashed_pword, //for testing purposes
                     output reg [0:127] plaintext);   //plaintext recovered word
    reg ready = 1'b1; //used to handshake with bruteforce module so we dont skip passwords while pancham is working
    wire reset; //tied to Drive module
    wire [0:127] guess;
    
    reg [0:127] word_in; //the word sent to pancham md5 encrypter, max 128
    reg [0:7] word_in_width; //endianness to match pancham module
    reg msg_in_valid = 1'b1; //boolean value indicating if input word is valid
    
    //outputs of pancham
    wire [0:127] hashed_password; //output of encrypter - endianness to match encrypter
    wire output_valid; //asserted if output message valid
    wire encrypter_ready; //if 1, encrypter is ready for next word
    
    wire equal_valid; //tells us if the output of the comparator is valid or not
    wire password_hashes_equal;
    reg [0:127] guess_to_compare; //passed into comparator module
    wire [0:7] numCharacters; //length of string being passed into pancham, received from BruteForce
    reg [0:7] numCharactersReg;
    reg bruteclk;
    wire sclk;
    /*
     Instantiation of Driver, BruteForce, pancham, and Comparator modules
     All but BruteForce share same clock
     */
    Driver driver(clock, enable, reset);
    BruteForce brute(bruteclk, enable, startingPosition, increment, ready, guess, numCharacters);
    pancham encrypter(clock, reset, word_in, word_in_width, msg_in_valid, hashed_password, output_valid, encrypter_ready);
    Comparator comp(target_hash, guess_to_compare, enable, clock, equal_valid, password_hashes_equal);
    
    
    always @ (posedge reset) begin
        enable <= 0; //pull enable low when reset
    end
    /*
     raise bruteclk for BruteForce Module
     */
    initial begin
        bruteclk = 0;
        bruteclk = 1;
    end
    
    always @ (posedge clock) begin
        if (reset == 1) begin //THIS SHOULD BE RESET == 0, 1 for TESTING PURPOSES
            enable <= 1; //enable all modules if reset is low, driver module manages reset
        end
            if (enable == 1) begin
                bruteclk <= output_valid; //BruteForce only gives the next string once pancham output is valid
                if (encrypter_ready == 1 && password_hashes_equal == 0 && ready == 1)begin //is pancham ready for next word, and we're not done
                    msg_in_valid = 1;
                    /*
                     used to assign guess from ASCIICounter to word_in
                     reverses endianness and
                     */
                    if (numCharacters == 8) begin
                        word_in <= guess[120:127];
                        end if (numCharacters == 16) begin
                        word_in <= {guess[112:119],guess[120:127]};
                        end if (numCharacters == 24) begin
                        word_in <= {guess[104:111],guess[112:119],guess[120:127]};
                        end if (numCharacters == 32) begin
                        word_in <= {guess[96:103],guess[104:111],guess[112:119],guess[120:127]};
                        end if (numCharacters == 40) begin
                        word_in <= {guess[88:95],guess[96:103],guess[104:111],guess[112:119],guess[120:127]};
                        end if (numCharacters == 48) begin
                        word_in <= {guess[80:87],guess[88:95],guess[96:103],guess[104:111],guess[112:119],guess[120:127]};
                        end if (numCharacters == 54) begin
                        word_in <= {guess[72:79],guess[80:87],guess[88:95],guess[96:103],guess[104:111],guess[112:119],guess[120:127]};
                        end if (numCharacters == 62) begin
                        word_in <= {guess[64:71],guess[72:79],guess[80:87],guess[88:95],guess[96:103],guess[104:111],guess[112:119],guess[120:127]};
                    end
                    word_in_width <= numCharacters; //num characters in bits from BruteForce
                    ready         <= 0; //bruteForce has given us a word, now make it idle.
                end
                    if (output_valid == 1) begin //checks if the output of pancham is valid
                        //assign output of encrypter to comparator
                        msg_in_valid = 0;
                        hashed_pword <= hashed_password;
                        ready        <= 1; //now we're ready to get the next word.
                        plaintext    <= word_in; //assigns word_in to plaintext output.
                    end
                guess_to_compare <= hashed_password;
            end//end if enable is 1.
        
        if (password_hashes_equal == 1)begin
            enable       <= 0; //we're done
            msg_in_valid <= 0;
            $finish;
        end
        
    end //end always
endmodule
