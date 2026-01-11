module I2C_protocol(clk,SDA,SCL,SW,start,ACK,NACK);

input clk,start;
input [15:0]SW;
inout SDA;
output reg ACK,NACK;
output SCL;

parameter IDLE = 0, Start = 1, Send = 2, Read_ACK = 3, Stop = 4;
reg [2:0]state = IDLE;

reg sda_out;
reg write;
reg i2c_clk;
reg [7:0]cnt = 0;

reg [15:0]temp_data;
reg [2:0]bit_count;
reg addr_sent;
reg [7:0]data;

always @(posedge clk) begin
if(cnt == 250) begin
i2c_clk <= ~i2c_clk;
cnt <= 0;
end

else cnt <= cnt + 1;

end
 
assign SCL = (state == IDLE || state == Start || state == Stop) ? 1 : i2c_clk;
assign SDA = (write == 1) ? sda_out : 1'bz;

always @(negedge i2c_clk) begin

case(state) 

IDLE: begin
write <= 1;
ACK <= 0;
NACK <= 0;
bit_count <= 0;
sda_out <= 1;
addr_sent <= 0;
data <= 0;
if(!start) begin
temp_data <= SW;
state <= Start;
data <= SW[15:8];
end
end

Start: begin
write <= 1;
sda_out <= 0;
state <= Send;
end

Send: begin
write <= 1;
sda_out <= data[7 - bit_count];
if(bit_count == 7) begin
bit_count <= 0;
state <= Read_ACK;
end
else bit_count <= bit_count + 1;
end

Read_ACK: begin
write <= 0;

if(addr_sent == 0) begin
if(SDA == 0) begin
state <= Send;
ACK <= 1;
addr_sent <= 1;
data <= temp_data[7:0];
end

else begin
state <= Stop;
NACK <= 1;
addr_sent <= 0;
sda_out <= 0;
end
end

else begin
if(SDA == 0) begin
state <= Stop;
ACK <= 1;
addr_sent <= 0;
sda_out <= 0;
end
else begin
state <= Stop;
NACK <= 1;
addr_sent <= 0;
sda_out <= 0;
end
end
end

Stop: begin
write <= 1;
sda_out <= 0;
state <= IDLE;
end

endcase

end

endmodule


