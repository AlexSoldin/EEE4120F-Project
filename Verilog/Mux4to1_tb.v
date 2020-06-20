module Mux4to1_tb();
    
    reg [127:0] in1, in2, in3, in4;
    reg [1:0] sel;
    wire [127:0] out;
    
    Mux4to1 uut(in1, in2, in3, in4, sel, out);
    
    initial begin
        $display("sel\tin1\t\t\t\t\tin2\t\t\t\t\tin3\t\t\t\t\tin4\t\t\t\t\tout");
        $monitor("%b\t%h\t%h\t%h\t%h\t%h",sel,in1,in2,in3,in4,out);
        in1 <= 128'hd3fa46720655e414eba34eff76a4106e;
        in2 <= 128'hcd3542249e4323fd902046f20d457a48;
        in3 <= 128'hb497dd1a701a33026f7211533620780d;
        in4 <= 128'h0cc175b9c0f1b6a831c399e269772661;
        #5;
        sel <= 2'b00;
        #5;
        sel <= 2'b01;
        #5;
        sel <= 2'b10;
        #5;
        sel <= 2'b11;
    end
    
endmodule
