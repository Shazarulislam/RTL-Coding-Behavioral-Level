module p_6b(A,B1,B2,B3,C1,C2,C3);
input B1,B2,B3,C1,C2,C3;
output reg A;

always@(*)
if(C1==1'b1) begin
	A<=B1;
end
else if (C2==1'b1) begin
	A<=B2;
end
else if (C3==1'b1) begin
	A<=B3;
end
else begin
	A<=0;
end
endmodule

//.........tb.............//
`timescale 1ns/1ns
module p_6b_tb;
reg B1,B2,B3,C1,C2,C3;
wire A;

//.......module instantiation..............//
p_6b f(A,B1,B2,B3,C1,C2,C3);

initial begin
C1=1'b1;
C2=1'b0;
C3=1'b0;
B1=1'b1;
B2=1'b0;
B3=1'b1;

#10 C1=1'b0;
#10 C2=1'b1;
#10 C3=1'b0;
#10 B1=1'b1;
#10 B2=1'b0;
#10 B3=1'b1;

#20 C1=1'b0;
#20 C2=1'b0;
#20 C3=1'b1;
#20 B1=1'b1;
#20 B2=1'b0;
#20 B3=1'b1;
end

//........system task.........//
initial begin
$monitor("T=%0t| C1=%b | C2=%b |C3=%b |B1=%b | B2= %b | B3=%b | A=%b",$realtime,C1,C2,C3,B1,B2,B3,A);
end
endmodule


