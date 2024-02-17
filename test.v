module tb;
 
 
reg clk = 0, wea = 0;
reg [10:0] addr;
reg [31:0] din;
wire [31:0] dout;
 
reg [31:0] mem [15:0];
 
 
 
initial begin
//$readmemh("inst_data.mem",mem);
$readmemb("inst_data.mem", mem);
end
 
 
reg [31:0] IR;
 
always #5 clk = ~clk;
 
integer count = 0;
 
integer delay = 0;
 
always@(posedge clk)
begin
if(delay < 4)
begin
delay <= delay + 1;
end
else
begin
count <= count + 1;
delay <= 0;
end
end
 
always@(*)
begin
IR = mem[count];
end
endmodule