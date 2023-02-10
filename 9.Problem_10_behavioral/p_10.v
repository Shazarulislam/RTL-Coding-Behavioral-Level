module p_10(clk,rst,count);
input clk, rst;
output reg [7:0]count; 
always @(posedge clk) begin 
    if (rst) begin 
        count <= 8'b0000_0011;
        end
    else begin 
        count <= count << 2;
        count[1] <= count[6];
        count[0] <= count[7];
    end
end
endmodule
//............. Test Bench..........//
`timescale 1 ps / 1 ps
module p_10_tb;
reg clk, rst; // DUT input 
wire [7:0]count; // DUT output
p_10 rc1(clk,rst,count); // DUT module instantiation

always #10 clk = ~clk; // T = 20

initial begin 
clk = 1'b0;
rst = 1'b0;
#10 rst = 1'b1;
#20 rst = 1'b0;
end
//..........system task.......//
initial 
$monitor("Time=%0t | clk=%b |rst=%b |count=%b",$realtime,clk,rst,count);
endmodule

