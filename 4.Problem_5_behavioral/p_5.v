module p_5(A,B,C,CE,CLK,Clr,Q);
input A,B,C,CLK,CE,Clr;
output reg Q;
//...................//
always@ (posedge CLK or posedge Clr) begin

if (Clr) begin
	Q<=0;
end
else if (CE==1'b1) begin
	if (C == 1'b0)begin
	Q<= A & B;
	end
	else begin
	Q<= A | B;
end
	end
end
endmodule

//.........tb..............//
`timescale 1ns/1ns
module p_5_tb;
reg A,B,C,CLK,CE,Clr;
wire Q;

//.........................//
integer i;

//.........module instantiation........//
p_5 f(A,B,C,CE,CLK,Clr,Q);

always #10 CLK=~CLK;  //Generate clock T=20

//.....Degine CE,CLR,CLK value..........//
initial begin
	CLK=1'b0;
	CE=1'b0;
	Clr= 1'b0;
	
	
#10	CLK=1'b1;
#20	CE=1'b1;
#10	Clr= 1'b0;	
	
end
initial begin
#5000 $stop;
end 

initial begin
    for(i=0; i<8; i=i+1) begin
    #10 {A,B,C}=i;
    end
end
//......system task............//
initial begin
$monitor ("T=%0t| Clr=%b | CE =%b |C=%b | A=%b | B=%b | Q=%b",$realtime,Clr,CE,C,A,B,Q);
end
endmodule

