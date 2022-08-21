`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////


module tb_DATAPATH;
parameter n=16,m=16;
wire[n+m-1:0] tb_Product;
wire tb_done;
reg tb_clk,
    tb_rst,
    tb_start;
reg[15:0] tb_multiplicand,
          tb_multiplier;
DATAPATH DUT(.Product(tb_Product),
                .done(tb_done),
                .clk(tb_clk),
                .multiplicand(tb_multiplicand),
                .multiplier(tb_multiplier),
                .start(tb_start),
                .rst(tb_rst));          
              
initial tb_clk=1'b0;
always #10 tb_clk=~tb_clk;
integer i;
initial 
begin
tb_rst=1'b1;
#15 tb_rst=1'b0;tb_start=1'b1;
$monitor($time,"tb_Product=%b",tb_Product);
for(i=1;i<=10;i=i+1)
 begin
 tb_start=1'b1;
 tb_multiplicand=16'b1111_1111_0000_0001;//{$random}%65535;
 tb_multiplier=16'b1111_0000_0000_0001;//{$random}%1599;
 #300 tb_multiplicand=16'b1100_1111_0000_0001;//{$random}%65535;
  tb_multiplier=16'b1111_0000_1100_0001;//{$random}%1599;
 #100 tb_start=1'b0;
 #400;
 
 end 
 
 $finish;
end              
endmodule