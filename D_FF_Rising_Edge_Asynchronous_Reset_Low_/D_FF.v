module D_FF(d,clk,reset,out);
input d,clk,reset;  
output out;
reg out;

always @(posedge clk or negedge reset) begin
if(reset == 1'b0) begin
	out = 1'b0;
	end
	else begin
	out = d;
	end
end
endmodule