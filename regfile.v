`include "decoders.v"
`include "register.v"
`include "mux.v"
//------------------------------------------------------------------------------
// MIPS register file
//   width: 32 bits
//   depth: 32 words (reg[0] is static zero register)
//   2 asynchronous read ports
//   1 synchronous, positive edge triggered write port
//------------------------------------------------------------------------------

module regfile
(
output[31:0]	ReadData1,	// Contents of first register read
output[31:0]	ReadData2,	// Contents of second register read
input[31:0]	WriteData,	// Contents to write to register
input[4:0]	ReadRegister1,	// Address of first register to read
input[4:0]	ReadRegister2,	// Address of second register to read
input[4:0]	WriteRegister,	// Address of register to write
input		RegWrite,	// Enable writing of register when High
input		Clk		// Clock (Positive Edge Triggered)
);

  wire [31:0] decoder_out;
  wire [31:0] reg0_out;
  wire [31:0] reg1_out;
  wire [31:0] reg2_out;
  wire [31:0] reg3_out;
  wire [31:0] reg4_out;
  wire [31:0] reg5_out;
  wire [31:0] reg6_out;
  wire [31:0] reg7_out;
  wire [31:0] reg8_out;
  wire [31:0] reg9_out;
  wire [31:0] reg10_out;
  wire [31:0] reg11_out;
  wire [31:0] reg12_out;
  wire [31:0] reg13_out;
  wire [31:0] reg14_out;
  wire [31:0] reg15_out;
  wire [31:0] reg16_out;
  wire [31:0] reg17_out;
  wire [31:0] reg18_out;
  wire [31:0] reg19_out;
  wire [31:0] reg20_out;
  wire [31:0] reg21_out;
  wire [31:0] reg22_out;
  wire [31:0] reg23_out;
  wire [31:0] reg24_out;
  wire [31:0] reg25_out;
  wire [31:0] reg26_out;
  wire [31:0] reg27_out;
  wire [31:0] reg28_out;
  wire [31:0] reg29_out;
  wire [31:0] reg30_out;
  wire [31:0] reg31_out;

  // Components
  // Decoder
  decoder1to32 decoder(.out(decoder_out),
                        .enable(RegWrite),
                        .address(WriteRegister));
  // Zero register
  register32zero reg0(.q(reg0_out),
                        .d(WriteData),
                        .wrenable(decoder_out[0]),
                        .clk(Clk));
  // Register 1
  register32 reg1(.q(reg1_out),
                     .d(WriteData),
                     .wrenable(decoder_out[1]),
                     .clk(Clk));
  // Register 2
  register32 reg2(.q(reg2_out),
                     .d(WriteData),
                     .wrenable(decoder_out[2]),
                     .clk(Clk));
  // Register 3
  register32 reg3(.q(reg3_out),
                     .d(WriteData),
                     .wrenable(decoder_out[3]),
                     .clk(Clk));
  // Register 4
  register32 reg4(.q(reg4_out),
                     .d(WriteData),
                     .wrenable(decoder_out[4]),
                     .clk(Clk));
  // Register 5
  register32 reg5(.q(reg5_out),
                     .d(WriteData),
                     .wrenable(decoder_out[5]),
                     .clk(Clk));
  // Register 6
  register32 reg6(.q(reg6_out),
                     .d(WriteData),
                     .wrenable(decoder_out[6]),
                     .clk(Clk));
  // Register 7
  register32 reg7(.q(reg7_out),
                     .d(WriteData),
                     .wrenable(decoder_out[7]),
                     .clk(Clk));
  // Register 8
  register32 reg8(.q(reg8_out),
                     .d(WriteData),
                     .wrenable(decoder_out[8]),
                     .clk(Clk));
  // Register 9
  register32 reg9(.q(reg9_out),
                     .d(WriteData),
                     .wrenable(decoder_out[9]),
                     .clk(Clk));
  // Register 10
  register32 reg10(.q(reg10_out),
                     .d(WriteData),
                     .wrenable(decoder_out[10]),
                     .clk(Clk));
  // Register 11
  register32 reg11(.q(reg11_out),
                     .d(WriteData),
                     .wrenable(decoder_out[11]),
                     .clk(Clk));
  // Register 12
  register32 reg12(.q(reg12_out),
                     .d(WriteData),
                     .wrenable(decoder_out[12]),
                     .clk(Clk));
  // Register 13
  register32 reg13(.q(reg13_out),
                     .d(WriteData),
                     .wrenable(decoder_out[13]),
                     .clk(Clk));
  // Register 14
  register32 reg14(.q(reg14_out),
                     .d(WriteData),
                     .wrenable(decoder_out[14]),
                     .clk(Clk));
  // Register 15
  register32 reg15(.q(reg15_out),
                     .d(WriteData),
                     .wrenable(decoder_out[15]),
                     .clk(Clk));
  // Register 16
  register32 reg16(.q(reg16_out),
                     .d(WriteData),
                     .wrenable(decoder_out[16]),
                     .clk(Clk));
  // Register 17
  register32 reg17(.q(reg17_out),
                     .d(WriteData),
                     .wrenable(decoder_out[17]),
                     .clk(Clk));
  // Register 18
  register32 reg18(.q(reg18_out),
                     .d(WriteData),
                     .wrenable(decoder_out[18]),
                     .clk(Clk));
  // Register 19
  register32 reg19(.q(reg19_out),
                     .d(WriteData),
                     .wrenable(decoder_out[19]),
                     .clk(Clk));
  // Register 20
  register32 reg20(.q(reg20_out),
                     .d(WriteData),
                     .wrenable(decoder_out[20]),
                     .clk(Clk));
  // Register 21
  register32 reg21(.q(reg21_out),
                     .d(WriteData),
                     .wrenable(decoder_out[21]),
                     .clk(Clk));
  // Register 22
  register32 reg22(.q(reg22_out),
                     .d(WriteData),
                     .wrenable(decoder_out[22]),
                     .clk(Clk));
  // Register 23
  register32 reg23(.q(reg23_out),
                     .d(WriteData),
                     .wrenable(decoder_out[23]),
                     .clk(Clk));
  // Register 24
  register32 reg24(.q(reg24_out),
                     .d(WriteData),
                     .wrenable(decoder_out[24]),
                     .clk(Clk));
  // Register 25
  register32 reg25(.q(reg25_out),
                     .d(WriteData),
                     .wrenable(decoder_out[25]),
                     .clk(Clk));
  // Register 26
  register32 reg26(.q(reg26_out),
                     .d(WriteData),
                     .wrenable(decoder_out[26]),
                     .clk(Clk));
  // Register 27
  register32 reg27(.q(reg27_out),
                     .d(WriteData),
                     .wrenable(decoder_out[27]),
                     .clk(Clk));
  // Register 28
  register32 reg28(.q(reg28_out),
                     .d(WriteData),
                     .wrenable(decoder_out[28]),
                     .clk(Clk));
  // Register 29
  register32 reg29(.q(reg29_out),
                     .d(WriteData),
                     .wrenable(decoder_out[29]),
                     .clk(Clk));
  // Register 30
  register32 reg30(.q(reg30_out),
                     .d(WriteData),
                     .wrenable(decoder_out[30]),
                     .clk(Clk));
  // Register 31
  register32 reg31(.q(reg31_out),
                     .d(WriteData),
                     .wrenable(decoder_out[31]),
                     .clk(Clk));

  // Mux 1
  mux32to1by32 mux1(ReadData1, ReadRegister1,
                     reg0_out,  reg1_out,  reg2_out,  reg3_out,  reg4_out,
                     reg5_out,  reg6_out,  reg7_out,  reg8_out,  reg9_out,
                     reg10_out,  reg11_out,  reg12_out,  reg13_out,  reg14_out,
                     reg15_out,  reg16_out,  reg17_out,  reg18_out,  reg19_out,
                     reg20_out,  reg21_out,  reg22_out,  reg23_out,  reg24_out,
                     reg25_out,  reg26_out,  reg27_out,  reg28_out,  reg29_out,
                     reg30_out,  reg31_out
                     );

  // Mux 2
  mux32to1by32 mux2(ReadData2, ReadRegister2,
                  reg0_out,  reg1_out,  reg2_out,  reg3_out,  reg4_out,
                  reg5_out,  reg6_out,  reg7_out,  reg8_out,  reg9_out,
                  reg10_out,  reg11_out,  reg12_out,  reg13_out,  reg14_out,
                  reg15_out,  reg16_out,  reg17_out,  reg18_out,  reg19_out,
                  reg20_out,  reg21_out,  reg22_out,  reg23_out,  reg24_out,
                  reg25_out,  reg26_out,  reg27_out,  reg28_out,  reg29_out,
                  reg30_out,  reg31_out
                  );


endmodule
