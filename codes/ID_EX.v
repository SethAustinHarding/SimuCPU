module ID_EX(
    clk_i,
    start_i,
    rst_i,

    ALUOp_i,
    ALUSrc_i,
    RegWrite_i,
    MemWrite_i,
    MemRead_i,
    MemtoReg_i,
    ALUOp_o,
	  ALUSrc_o,
    RegWrite_o,
    MemWrite_o,
    MemRead_o,
    MemtoReg_o,

    RS1data_i,
    RS2data_i,
    imm_i,
    funct_i,
    RS1data_o,
    RS2data_o,
    imm_o,
    funct_o,

    RS1addr_i,
    RS2addr_i,
    RS1addr_o,
    RS2addr_o,

    RDaddr_i,
    RDaddr_o,

    mem_stall_i
);


// Ports
input                    mem_stall_i;
input                    clk_i, start_i, rst_i;
input       [1:0]        ALUOp_i;
input                    ALUSrc_i, RegWrite_i, MemWrite_i, MemRead_i, MemtoReg_i;
output reg  [1:0]        ALUOp_o;
output reg               ALUSrc_o, RegWrite_o, MemWrite_o, MemRead_o, MemtoReg_o;

input       [31:0]       pc_i;
output reg  [31:0]       pc_o;

input       [31:0]       RS1data_i, RS2data_i;
input       [31:0]       imm_i;
input       [9:0]        funct_i;
input       [4:0]        RDaddr_i, RS1addr_i, RS2addr_i;

output reg  [31:0]       RS1data_o, RS2data_o;
output reg  [31:0]       imm_o;
output reg  [9:0]        funct_o;
output reg  [4:0]        RDaddr_o, RS1addr_o, RS2addr_o;


always @(posedge clk_i) begin
  if (rst_i) begin
    ALUSrc_o <= 1'b0;
    RegWrite_o <= 1'b0;
    MemWrite_o <= 1'b0;
    MemRead_o <= 1'b0;
    MemtoReg_o <= 1'b0;
    RS1data_o <= 32'b0;
    RS2data_o <= 32'b0;
    imm_o <= 32'b0;
    funct_o <= 10'b0;
    RDaddr_o <= 5'b0;
    RS1addr_o <= 5'b0;
    RS2addr_o <= 5'b0;
  end
  if (~mem_stall_i && start_i) begin
    ALUOp_o <= ALUOp_i;
	  ALUSrc_o <= ALUSrc_i;
    RegWrite_o <= RegWrite_i;
    MemWrite_o <= MemWrite_i;
    MemRead_o <= MemRead_i;
    MemtoReg_o <= MemtoReg_i;
    RS1data_o <= RS1data_i;
    RS2data_o <= RS2data_i;
    imm_o <= imm_i;
	  funct_o <= funct_i;
    RDaddr_o <= RDaddr_i;
    RS1addr_o <= RS1addr_i;
    RS2addr_o <= RS2addr_i;

  end
end


endmodule
