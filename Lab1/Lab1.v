// Code your design here
/** 
* @file		Lab1_tb.v
* @author	Ismael Holguin
* @date		2022-01-31
* @brief	Lab 1 consist of development OR, AND, NOT, and XOR gates using the universal NAND gate
*/

`timescale 10ns / 1ps //set timescale 

// module NAND consists of 2 inputs and 1 output
module Nand(
    input Nand1,
    input Nand2,
    output NandOut
   );
   assign NandOut = ~(Nand1 & Nand2);
endmodule

// module Inverter consists of 2 inputs and 1 output
module Inverter(
    input Inv1,
    input Inv2,
    output reg InvOut
    );
  //  while-loop
   always @ (Inv1 or Inv2)
   begin 
       if(Inv1 == 1'b1 | Inv2 == 1'b1)
   begin 
       InvOut =1'b0;
   end 
    else
       InvOut = 1'b1;  
    end
   
endmodule

// module AND consist of 2 inputs and 1 output
module AND(
    input AND1,
    input AND2,
    output ANDOut);
// create wire to store the value between gates
  	wire z;
//create an instance of Nand gate and pass input 1 and 2 named NI1
  Nand NI1(.Nand1(AND1), .Nand2(AND2), .NandOut(ANDOut));
//create an instance of Inverter gate and pass input 1 and 2 named IN1  
  Inverter IN1(.Inv1(z), .Inv2(z), .InvOut(ANDOut));
endmodule

// module OR consists of 2 inputs and 1 output
module Or(
    input Or1,
    input Or2,
    output OrOut
    );
//create wires to hold values between gates
    wire or_out1;
    wire or_out2;
  
//instance of Inverter called NI1 passing 2 inputs 
  Inverter NI1(.Inv1(Or1), .Inv2(Or1), .InvOut(or_out1));
  
////instance of Inverter called NI2 passing 2 inputs 
  Inverter NI2(.Inv1(Or2), .Inv2(Or1), .InvOut(or_out2));
//instance of Nand called NI3 passing 2 inputs of wires  
  Nand NI3(.Nand1(or_out1), .Nand2(or_out2), .NandOut(OrOut));
endmodule

// module XOR consists of 2 inputs and 1 output
module Xor(
    input XorIn1,
    input XorIn2,
    output XorOut
    );
// create wires to store the values between gates
    wire j;
    wire k;
    wire l;
    wire m;
//instance of Inverter called Ni1 passing 2 inputs 
  Inverter Ni1(.Inv1(XorIn1), .Inv2(XorIn1), .InvOut(j));
  
//instance of Inverter called Ni1 passing 2 inputs 
  Inverter Ni2(.Inv1(XorIn2), .Inv2(XorIn2), .InvOut(k));
  
//instance of Nand called Ni3 passing 2 inputs 
  Nand Ni3(.Nand1(XorIn1), .Nand2(k), .NandOut(l));
  
//instance of Nand called Ni4 passing 2 inputs 
  Nand Ni4(.Nand1(XorIn2), .Nand2(j), .NandOut(m));
  
//instance of Nand called Ni5 passing 2 inputs 
  Nand Ni5(.Nand1(l), .Nand2(m), .NandOut(XorOut));
endmodule