module DFF_P(d,clk,out);
input d,clk;
output out;
reg out;

always @(posedge clk) begin
	out <= d;
end
endmodule

//test bench//

`timescale 1ns / 1ns
//1. Declare module and ports
module DFF_P_tb; 
reg d, clk;  //dut input
wire out;   // dut putput 


//2. Instantiate the module we want to test
DFF_P f(d,clk,out);  // dut module instantiation


// apply test vectors
initial begin
  clk=0;
     forever #10 clk = ~clk;  
end

initial
begin

#10 d= 1;
#10 d= 0;
#10 d= 1;
#10 d= 0;
#10 d= 1;
#10 d= 0;
end
//3. Monitor TB ports
initial
$monitor ("T = %0t \n d=%b | out= %b", $realtime,d,out);

endmodule

