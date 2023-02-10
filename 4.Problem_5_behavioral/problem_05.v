module problem_05(A,B,C,CLK,CLR,Q);
input A,B,C,CLK,CLR;
output reg Q;
wire D;
assign D=((A & B) & ~ C) |  ((A | B) & C);

always@(posedge CLK or posedge CLR) begin
	if(CLR)
		Q <= 0;
	else
		Q<= D;
end

endmodule

	