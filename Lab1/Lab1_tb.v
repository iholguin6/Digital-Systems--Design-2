// Code your testbench here
// or browse Examples
/** 
* @file		Lab1_tb.v
* @author	Ismael Holguin
* @date		2022-01-31
* @brief	Lab 1 testbench, veryfying module functionality
*/
`timescale 10ns / 1ps //set timescale 
module Lab1_tb; 
	
  // registers -> inputs
  	// wire -> outputs
  
  // Varibel declaration for NAND
  	reg Nand_x;
  	reg Nand_y;
  	wire Nand_z;
// Variable declaration for Inverter
    reg Inv_x;
  	reg Inv_y;
  	wire Inv_z;
  // Variables declaration for AND
  	reg And_x;
  	reg And_y;
  	wire And_z;
	
  // Variable declaration for OR
  	reg Or_x;
  	reg Or_y;
  	wire Or_z;
// Variable declaration for XOR
  	reg Xor_x;
  	reg Xor_y;
  	wire Xor_z;

  
///	Instantiating the GATES  	
  

  Nand uut(
    .Nand1(Nand_x),
    .Nand2(Nand_y),
    .NandOut(Nand_z)
  );


  Inverter uut1(
    .Inv1(Inv_x),
    .Inv2(Inv_y),
    .InvOut(Inv_z)  
  );   
     
  AND uut2(
    .AND1(And_x),
    .AND2(And_y),
    .ANDOut(And_z)  
  );
     
    
  Or uut3(
    .Or1(Or_x),
    .Or2(Or_y),
    .OrOut(Or_z)  
  );
   
  Xor uut4(
    .XorIn1(Xor_x),   
    .XorIn2(Xor_y),
    .XorOut(Xor_z)   
  );
 
  initial 
    begin

  
   /// ALL work on #1 clock cycle 
   
   Nand_x =0; Nand_y=0;

   #1 Nand_x =0; Nand_y=1;
   #1 Nand_x =1; Nand_y=0;
   #1 Nand_x =1; Nand_y=1;

   
   Inv_x=0; Inv_y=0;

   #1 Inv_x=0; Inv_y=1;
   #1 Inv_x=1; Inv_y=0;
   #1 Inv_x=1; Inv_y=1;   
   
   And_x=0; And_y=0;

   #1 And_x=0; And_y=1;
   #1 And_x=1; And_y=0;
   #1 And_x=1; And_y=1;

   Or_x=0; Or_y=0;

   #1 Or_x=0; Or_y=1;
   #1 Or_x=1; Or_y=0;
   #1 Or_x=1; Or_y=1;
   
   Xor_x=0; Xor_y=0;

   #1 Xor_x=0; Xor_y=1;
   #1 Xor_x=1; Xor_y=0;
   #1 Xor_x=1; Xor_y=1;

   #5 $finish; //ends the test bench code
end
endmodule
