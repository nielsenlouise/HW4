// Single-bit D Flip-Flop with enable
//   Positive edge triggered
module register
(
output reg	q,
input		d,
input		wrenable,
input		clk
);

    always @(posedge clk) begin
        if(wrenable) begin
            q <= d;
        end
    end

endmodule

// 32 bit register with enable
//   Positive edge triggered
module register32
(
output reg [31:0] q,
// output [31:0]     q,
input [31:0]      d,
input             wrenable,
input             clk
);

  // Just like the 1-bit register
  always @(posedge clk) begin
    if (wrenable) begin
      q <= d;
    end
  end
endmodule

// 32 register with enable, positive edge triggered
// Ignores inputs, just outputs 32b'0
module register32zero
(
output [31:0]     q,
input [31:0]      d,
input             wrenable,
input             clk
);
  // Regardless of input, q is zero
  assign q = 0;

endmodule
