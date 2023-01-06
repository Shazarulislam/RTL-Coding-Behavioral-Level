module D_FF(d,clk,reset,out);
input d,clk,reset;  
output out;
reg out;

always @(posedge clk or posedge reset) begin
if(reset == 1'b1) begin
	out = 1'b0;
	end
	else begin
	out = d;
	end
end
endmodule
