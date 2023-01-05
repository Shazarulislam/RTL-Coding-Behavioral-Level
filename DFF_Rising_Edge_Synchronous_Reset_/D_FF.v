module D_FF(d,clk,reset,out);
input d,clk,reset; //data input
output reg out;  //data output

always @(posedge clk) begin
	if (reset== 1'b1) begin
		out <=1'b0;
		end
	else begin
		out <=d;
	end
end
endmodule