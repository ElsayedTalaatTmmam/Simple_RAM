`timescale 1us/1ns
module RAM_TB # (
    parameter ADDR_WIDTH = 4,
    parameter MEM_DEPTH = 8,
    parameter MEM_WIDTH = 16)();

reg                   WrEn_TB,RdEn_TB;
reg                   CLK_TB,RST_TB;
reg  [ADDR_WIDTH-1:0] address_TB;
reg  [MEM_WIDTH-1:0]  WrData_TB;
wire [MEM_WIDTH-1:0]  RdData_TB;



RAM # (
     .ADDR_WIDTH (ADDR_WIDTH),
     .MEM_DEPTH  (MEM_DEPTH),
     .MEM_WIDTH  (MEM_WIDTH))
DUT_RAM (
.WrEn (WrEn_TB),
.RdEn  (RdEn_TB),
.CLK  (CLK_TB),
.RST (RST_TB),
.address  (address_TB),
.WrData (WrData_TB),
.RdData(RdData_TB)
);

// CLOCK Generator
always #5 CLK_TB=~CLK_TB;

// Initialization
initial 
  begin
    $dumpfile("RAM.cdv");
    $dumpvars;
    CLK_TB=1'b0;
    RST_TB=1'b1;
    address_TB=4'b0;
    RdEn_TB=1'b0;
    WrEn_TB=1'b0;
    WrData_TB=16'b0;

$display("tast_1  ");    
  #3 
    RdEn_TB=1'b0;
    WrEn_TB=1'b1;
    address_TB=4'b0011;
    WrData_TB=16'hAC31;
  #7
    RdEn_TB=1'b1;
    WrEn_TB=1'b0;
  #10
    if(RdData_TB==16'hAC31 )
         $display("tast_1    is passed");
    else $display("tast_1    is fialed");

$display("tast_2  ");    
  #3 
    RdEn_TB=1'b0;
    WrEn_TB=1'b1;
    address_TB=4'b0110;
    WrData_TB=16'h0025;
  #7
    RdEn_TB=1'b1;
    WrEn_TB=1'b0;
  #10
    if(RdData_TB==16'h0025 )
         $display("tast_2    is passed");
    else $display("tast_2    is fialed");

$display("tast_3  ");    
  #3 
    RdEn_TB=1'b0;
    WrEn_TB=1'b1;
    address_TB=4'b0001;
    WrData_TB=16'h1031;
  #7
    RdEn_TB=1'b1;
    WrEn_TB=1'b0;
  #10
    if(RdData_TB==16'h1031 )
         $display("tast_3    is passed");
    else $display("tast_3    is fialed");

$display("tast_4  ");    
  #3 
    RdEn_TB=1'b1;
    WrEn_TB=1'b0;
    address_TB=4'b0110;
  #10
    if(RdData_TB==16'h0025 )
         $display("tast_4    is passed");
    else $display("tast_4    is fialed");

$display("tast_5  ");    
  #3 
    RdEn_TB=1'b1;
    WrEn_TB=1'b0;
    address_TB=4'b0011;
  #10
    if(RdData_TB==16'hAC31 )
         $display("tast_5    is passed");
    else $display("tast_5    is fialed");
 #100
 $finish ;
end
endmodule








