module fulladder(
    input a,
    input b,
    input cin,
    output sum,
    output cout
);
assign sum = a^b^cin;
assign cout = (a&b)|(b&cin)|(cin&a);
endmodule //fulladder

module adder(
    input [3:0]a,
    input [3:0]b, 
    input cin,
    output [3:0]sum, 
    output cout
    
);
wire c1, c2, c3;

    fulladder ff0( .a(a[0]), .b(b[0]), .cin(cin), .sum(sum[0]), .cout(c1));
    fulladder ff1( .a(a[1]), .b(b[1]), .cin(c1), .sum(sum[1]), .cout(c2));
    fulladder ff2( .a(a[2]), .b(b[2]), .cin(c2), .sum(sum[2]), .cout(c3));
    fulladder ff3( .a(a[3]), .b(b[3]), .cin(c3), .sum(sum[3]), .cout(cout));
endmodule 


module multiplier_4_bit( input [3:0]a, input [3:0]b, output [7:0]y);

wire [3:0]pp0, pp1, pp2, pp3;// partial products 
wire [3:0]sum1, sum2, sum3;//sums of multiplications
wire c1, c2, c3;// carry of multiplication

// multplying all inputs using and gate

assign pp0 = a&{4{b[0]}};
assign pp1 = a&{4{b[1]}};
assign pp2 = a&{4{b[2]}};
assign pp3 = a&{4{b[3]}};

// lsb to output 
assign y[0]=pp0[0];
//addition of all rest bits 
adder s1(.a({1'b0,pp0[3:1]}), .b(pp1),.cin(1'b0),.sum(sum1),.cout(c1));
//msb to souput
assign y[1]= sum1[0];
adder s2(.a({c1,sum1[3:1]}), .b(pp2),.cin(1'b0),.sum(sum2),.cout(c2));
assign y[2]=sum2[0];
adder s3(.a({c2,sum2[3:1]}), .b(pp3),.cin(1'b0),.sum(sum3),.cout(c3));
assign y[6:3]=sum3;
assign y[7]=c3;



endmodule