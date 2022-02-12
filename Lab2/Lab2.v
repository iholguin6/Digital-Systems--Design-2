module And(input A, input B, output andOut);
  assign andOut = A&B;
endmodule 

module Or(input A, input B, output orOut);
  assign orOut = A|B;
endmodule 

module FullAdder(input A, input B, input C, output Sum, output Cout);
  wire a1,a2,a3,a4,a5,a6;
  wire o1,o2,o3,o4;
  
  /****	 The following creates A XOR B	****/
  And and1(.A(~A),.B(B),.andOut(a1));
  And and2(.A(A),.B(~B),.andOut(a2));
  Or or1(.A(a1),.B(a2),.orOut(o1)); 
  
  /****	The following creates the Cout	****/
  And and3(.A(A),.B(B), .andOut(a3));
  And and4(.A(C),.B(o1),.andOut(a4));
  Or or2(.A(a3),.B(a4),.orOut(Cout));
  
  /****	The following creates the Sum	****/
  And and5(.A(~o1), .B(C), .andOut(a5));
  And and6(.A(o1), .B(~C), .andOut(a6));
  Or or3(.A(a5), .B(a6), .orOut(Sum));
  
endmodule

module HexAdder(input [3:0]A, input[3:0]B, input C, output [3:0]Sum, output Cout);

  	//create wire to store Cin output
    wire co, c1, c2;
    //instantiate Fulll-adder modules
    FullAdder f1(.A(A[0]),.B(B[0]),.C(C),.Sum(Sum[0]),.Cout(co));
    FullAdder f2(.A(A[1]),.B(B[1]),.C(co),.Sum(Sum[1]),.Cout(c1));
    FullAdder f3(.A(A[2]),.B(B[2]),.C(c1),.Sum(Sum[2]),.Cout(c2));
    FullAdder f4(.A(A[3]),.B(B[3]),.C(c2),.Sum(Sum[3]),.Cout(Cout));

endmodule
