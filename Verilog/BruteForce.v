/* BruteForce.v
 Used to generate strings of up to 8 characters 
 */
module BruteForce(input clock,
                  input enable,
                  input [7:0] startingPosition,       //starting letter position
                  input [2:0] increment,              //number of letters to increment by
                  input ready,                        //when controller module is ready, give it a password
                  output reg[127:0] password,         //the output password
                  output reg[0:7] numCharacters = 8); //number of characters in bits
    
    wire e0, e1, e2, e3, e4, e5, e6;    //wrap bits for each ASCIICounter
    wire[127:0] tempPassword;           //temp password, output of each ASCIICounter
    reg[127:0] finalPassword;           //allows for a 16 byte long character string
    
    ASCIICounter a0(clock, enable, startingPosition, increment, ready, tempPassword[7:0], e0);
    /*
     The clock of a1 is the speed of toggle of the wrap bit of a0
     */
    ASCIICounter a1(e0, enable, startingPosition, increment, 1'b1, tempPassword[15:8], e1);
    /*
     The clock of a2 is the speed of toggle of the wrap bit of a1
     */
    ASCIICounter a2(e1, enable, startingPosition, increment, 1'b1, tempPassword[23:16], e2);
    /*
     The clock of a3 is the speed of toggle of the wrap bit of a2
     */
    ASCIICounter a3(e2, enable, startingPosition, increment, 1'b1, tempPassword[31:24], e3);
    /*
     The clock of a4 is the speed of toggle of the wrap bit of a3
     */
    ASCIICounter a4(e3, enable, startingPosition, increment, 1'b1, tempPassword[39:32], e4);
    /*
     The clock of a5 is the speed of toggle of the wrap bit of a4
     */
    ASCIICounter a5(e4, enable, startingPosition, increment, 1'b1, tempPassword[47:40], e5);
    /*
     The clock of a6 is the speed of toggle of the wrap bit of a5
     */
    ASCIICounter a6(e5, enable, startingPosition, increment, 1'b1, tempPassword[55:48], e6);
    /*
     The clock of a7 is the speed of toggle of the wrap bit of a6
     */
    ASCIICounter a7(e6, enable, startingPosition, increment, 1'b1, tempPassword[63:56], e7);
    
    reg r1,r2,r3,r4,r5,r6,r7,r8 = 0; //to keep track of which counters have started
    /* triggers on each ASCIICounter's clock */
    always @(posedge clock, e0, e1, e2, e3, e4, e5, e6, e7) begin
        /* if enable and ready are high, combine outputs from ASCIICounters into password register */
        if (enable == 1 && ready == 1) begin
            password      <= 128'h0000000000000000;
            password[7:0] <= tempPassword[7:0];
            
            if (r1 == 1)begin
                password[15:8] <= tempPassword[15:8];
            end
            if (r2 == 1)begin
                password[23:16] <= tempPassword[23:16];
            end
            if (r3 == 1)begin
                password[31:24] <= tempPassword[31:24];
            end
            if (r4 == 1)begin
                password[39:32] <= tempPassword[39:32];
            end
            if (r5 == 1)begin
                password[47:40] <= tempPassword[47:40];
            end
            if (r6 == 1)begin
                password[55:48] <= tempPassword[55:48];
            end
            if (r7 == 1)begin
                password[63:56] <= tempPassword[63:56];
            end
            if (r8 == 1)begin
                password[71:64] <= tempPassword[71:64];
            end
        end //end if
        
        /* once a ASCIICounter wraps, note that the next one has been activated
         used for counting characters
         */
        if (e0 == 1)begin
            r1 <= 1'b1;
        end
        if (e1 == 1)begin
            r2 <= 1'b1;
        end
        if (e2 == 1)begin
            r3 <= 1'b1;
        end
        if (e3 == 1)begin
            r4 <= 1'b1;
        end
        if (e4 == 1)begin
            r5 <= 1'b1;
        end
        if (e5 == 1)begin
            r6 <= 1'b1;
        end
        if (e6 == 1)begin
            r7 <= 1'b1;
        end
        if (e7 == 1)begin
            r8 <= 1'b1;
        end
        
    end //end always
    /* increment numCharacters by 8 bits as each ASCIICounter is activated */
    always @ (posedge r2, posedge r3, posedge r4, posedge r5, posedge r6, posedge r7, posedge r8) begin
        numCharacters = numCharacters + 8;
    end
endmodule
