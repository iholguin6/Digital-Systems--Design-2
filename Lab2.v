//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/07/2022 10:37:40 AM
// Design Name: 
// Module Name: Lab2
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
`timescale 10ns / 1ps //set timescale 
module And(
    input A,
    input B,
    output Out
    );
    assign Out = A&B;
endmodule
    
module Or(
    input A,
    input B,
    output Out
    );
    assign Out = A|B;
endmodule

module FullAdder(
    input A,
    input B,
    input C,
    output Cout,
    output Sum
    );
   
    wire and0,and1,and2,and3,and4,and5,and6,and7,and8,and9,and10,or1,or2,or3;    
   And And1(.A(A), .B(C), .Out(and0));
   And And2(.A(A), .B(B), .Out(and1));
   And And3(.A(B), .B(C), .Out(and2));
   Or Or1(.A(and0), .B(and2), .Out(or1));
   Or Or2(.A(and1), .B(or1), .Out(Cout));
   
   
   
   And And4(.A(~A), .B(~B), .Out(and3));
   And And5(.A(~A), .B(B), .Out(and4));
   And And6(.A(A), .B(B), .Out(and5));
   And And7(.A(A), .B(~B), .Out(and6));
   And And8(.A(and3), .B(C),.Out(and7));
   And And9(.A(~C),.B(and4), .Out(and8));
   And And10(.A(and5), .B(C), .Out(and9));
   And And11(.A(and6), .B(~C), .Out(and10));
   Or Or3(.A(and7),.B(and8),.Out(or2));
   Or Or4(.A(and9),.B(and10),.Out(or3));
   Or Or5(.A(or2),.B(or3), .Out(Sum));
   
   
endmodule

module HexAdder(
input [3:0]HexA,
input [3:0]HexB,
input Cin,
output [3:0]HexS,
output Cout
);
wire c0,c1,c2,c3;
FullAdder add0(.A(HexA[0]),.B(HexB[0]), .C(Cin), .Sum(HexS[0]),.Cout(c0));
FullAdder add1(.A(HexA[1]),.B(HexB[1]), .C(c0), .Sum(HexS[1]),.Cout(c1));
FullAdder add2(.A(HexA[2]),.B(HexB[2]), .C(c1), .Sum(HexS[2]),.Cout(c2));
FullAdder add3(.A(HexA[3]),.B(HexB[3]), .C(c2), .Sum(HexS[3]),.Cout(Cout));

endmodule