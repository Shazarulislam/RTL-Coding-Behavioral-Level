module P_4(A,B,Ora,C0,C1,C2,Clk,Ad);
input [2:0] A,B;
input Clk,Ad,Ora;
output reg C0,C1,C2;

wire [2:0] Sum,OR;
//.................//
assign Sum = A ^ B;
assign OR = A | B;
//...............//
always@(posedge Clk) begin
	if(Ora | Ad ==1'b0)begin
		if(Ora==1'b0) begin
			C0 <= Sum[0];
			C1 <= Sum[1];
			C2 <= Sum[2];
		end
		else begin
			C0 <= OR[0];
			C1 <= OR[1];
			C2 <= OR[2];
		end
	end
 end
 endmodule
 
 //............tb............//
 module P_4_tb;
 reg [2:0] A,B;
 reg Clk,Ad,Ora;
 wire C0,C1,C2;
 
 integer i;
 
 P_4 f(A,B,Ora,C0,C1,C2,Clk,CE,Ad);
 

always #10 Clk=~Clk;
 
initial begin
	Clk= 1'b0;
	Ad = 1'b0;

	#10 Clk= 1'b1;
	#10 Ad = 1'b0;
end
initial begin
	for (i=0; i <128 ;i=i+1)begin
		#10 {A,B,Ora}=i;
	end
end
initial begin
	$monitor("Time= %0t |Clk=%b| Ora=%b| A=%b | B=%b | C0=%b | C1=%b | C2=%b ",$realtime,Clk,Ora,A,B,C0,C1,C2);
end
endmodule

 