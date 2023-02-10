module p_6a(A,B1,B2,B3,C);
input B1,B2,B3,C;
output reg A;
//.........................//
always @(B1 or B2 or B3 or C)
if(C==1'd1)begin
	A<=B1;
end
else if (C==1'd2) begin
	A<=B2;
end
else if (C==1'd3)begin
	A<=B3;
end
else begin
	A<=0;
end
endmodule

//.........tb.............//
`timescale 1ns/1ns
module p_6a_tb;
reg B1,B2,B3,C;
wire A;

//.......module instantiation..............//
p_6a f(A,B1,B2,B3,C);

initial begin
C=1'd1;
B1=1'b1;
B2=1'b0;
B3=1'b1;

#10 C=1'd3;
#10 B1=1'b1;
#10 B2=1'b0;
#10 B3=1'b1;

#20 C=1'd2;
#20 B1=1'b1;
#20 B2=1'b0;
#20 B3=1'b1;
end

//........system task.........//
initial begin
$monitor("T=%0t| C=%d | B1=%b | B2= %b | B3=%b | A=%b",$realtime,C,B1,B2,B3,A);
end
endmodule

/*
# T=0| C=1 | B1=1 | B2= 0 | B3=1 | A=1
# T=60| C=0 | B1=1 | B2= 0 | B3=1 | A=0 
*/