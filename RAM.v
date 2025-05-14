module RAM # (
    parameter ADDR_WIDTH = 4,
    parameter MEM_DEPTH = 8,
    parameter MEM_WIDTH = 16)
(
    input  wire                   WrEn,RdEn,
    input  wire                   CLK,RST,
    input  wire  [ADDR_WIDTH-1:0] address,
    input  wire  [MEM_WIDTH-1:0]  WrData, 
    output reg   [MEM_WIDTH-1:0]  RdData

);

    // 2D Array
    reg [MEM_WIDTH-1:0] memory [MEM_DEPTH-1:0];        

    always @(posedge CLK or negedge RST )
	  begin
        if (!RST)
           begin
          memory[0]<=1'b0;
          memory[1]<=1'b0;
          memory[2]<=1'b0;
          memory[3]<=1'b0;
          memory[4]<=1'b0;
          memory[5]<=1'b0;
          memory[6]<=1'b0;
          memory[7]<=1'b0;
            end

        else if (WrEn && !RdEn)
		 begin
            memory[address] <= WrData;
		 end

        else if (RdEn && !WrEn)
                 begin
            RdData <= memory[address]; 
                 end
        else
             memory[address] <=0; 
       end

endmodule
