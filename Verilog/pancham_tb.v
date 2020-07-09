/*****************************************************************
 Pancham is an MD5 compliant IP core for cryptographic applicati
 -ons. 
 Copyright (C) 2003  Swapnajit Mittra, Project VeriPage
 (Contact email: verilog_tutorial at hotmail.com
  Website      : http://www.angelfire.com/ca/verilog)

 This library is free software; you can redistribute it and/or
 modify it under the terms of the GNU Lesser General Public
 License as published by the Free Software Foundation; either
 version 2.1 of the License, or (at your option) any later version.
 
 This library is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 Lesser General Public License for more details.
 
 You should have received a copy of the GNU Lesser General Public
 License along with this library; if not, write to the 
 
 Free Software Foundation, Inc.
 59 Temple Place, Suite 330
 Boston, MA  02111-1307 
 USA
 ******************************************************************/
/* pancham_tb.v Testbench
 used to determine the hashes for 'lex,' 'akha,' 'vader,' and 'jackson'
 modified from top.v from pancham library
 */
module pancham_tb;

reg          clk;
reg          rst;
reg  [0:127] m_in;
reg    [0:7] m_in_w;
reg          m_in_val;

wire [0:127] m_out;
wire         m_out_val;
wire         ready;
//------------------------------
//
// Design Under Test 
//
//------------------------------
pancham MD5(
        .clk           (clk      )
      , .reset	       (rst      )
      , .msg_in        (m_in     )
      , .msg_in_width  (m_in_w   )
      , .msg_in_valid  (m_in_val )
                        
      , .msg_output    (m_out    )
      , .msg_out_valid (m_out_val)
      , .ready         (ready    )
      );

// Clock
initial 
   clk = 1'b0;

always 
   #5 clk = ~clk;

// Reset
initial begin // {
   rst = 1'b1;
   #12;
   rst = 1'b0;
end // }

// Message input vector
initial begin // {
   m_in_val = 1'b0;

   // Wait till the chip comes out of reset and ready 
   wait (!rst & ready);
   $display ("-------- MD5 --------");
   $display ("Input:\t\tlex \nBit Width:\t24 bits");
   m_in     = "lex";
   m_in_w   = 8*3;
   m_in_val = 1'b1;
   #10;
   m_in_val = 1'b0;
   // Wait for the result to come out; then compare
   wait(m_out_val);
   $display("Output:\t\t%h\n", m_out);

   wait (ready);
   #10 $display ("Input:\t\takha \nBit Width:\t32 bits");
   m_in     = "akha";
   m_in_w   = 8*4;
   m_in_val = 1'b1;
   #10;
   m_in_val = 1'b0;
   // Wait for the result to come out; then compare
   wait(m_out_val);
   $display("Output:\t\t%h\n", m_out);

   // Wait till the chip becomes ready
   wait (ready);
   #10 $display ("Input:\t\tvader \nBit Width:\t40 bits");
   m_in     = "vader";  
   m_in_w   = 8*5;
   m_in_val = 1'b1;
   #10;
   m_in_val = 1'b0;
   // Wait for the result to come out; then compare
   wait(m_out_val);
   $display("Output:\t\t%h\n", m_out);

   // Wait till the chip becomes ready
   wait (ready);
   #10 $display ("Input:\t\tcoffee \nBit Width:\t48 bits");
   m_in     = "coffee";  
   m_in_w   = 8*6;
   m_in_val = 1'b1;
   #10;
   m_in_val = 1'b0;
   // Wait for the result to come out; then compare
   wait(m_out_val);
   $display("Output:\t\t%h\n", m_out);

   // Wait till the chip becomes ready
   wait (ready);
   #10 $display ("Input:\t\tjackson \nBit Width:\t56 bits");
   m_in     = "jackson"; 
   m_in_w   = 8*7;
   m_in_val = 1'b1;
   #10;
   m_in_val = 1'b0;
   // Wait for the result to come out; then compare
   wait(m_out_val);
   $display("Output:\t\t%h", m_out);

   #100;
   $finish;
end 
endmodule