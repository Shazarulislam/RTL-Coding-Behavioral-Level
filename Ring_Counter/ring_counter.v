module ring_counter(rst,clk,count);
input rst,clk;
output reg[3:0] count;
//.................................//
always@(clk or rst) begin
	if (rst) begin
		count <=4'b1000;
	end
	else begin
		count<= count >>1;
		count[3] <= count[0];
	end
end
endmodule


//.........tb......///////
`timescale 1ns/1ns
module ring_counter_tb;
reg rst,clk;
wire [3:0] count;

ring_counter f(rst,clk,count);
always #10 clk=~clk;

initial begin
	clk=1'b1;
	rst=1'b1;
	#10 rst= 1'b0;
end

initial begin
	$monitor("Time =%0t | clk= %b | rst =%b |count=%b",$realtime,clk,rst,count);
end
endmodule

