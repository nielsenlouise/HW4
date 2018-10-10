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
  // // Generate a bunch of registers and assign them
  // genvar i;
  // generate
  //   for (i=0; i<32; i=i+1)
  //   begin:genblock
  //       register reg1bit(q[i], d[i], wrenable, clk);
  //   end
  // endgenerate

  // Alternately... I can just do this...
  always @(posedge clk) begin
    if (wrenable) begin
      q <= d;
    end
  end
endmodule

module register32zero
(
output reg [31:0] q,
// output [31:0]     q,
input [31:0]      d,
input             wrenable,
input             clk
);
  // // Regardless of input, q is zero
  // assign q = 0;

  // or ... with output reg ...
  // would this just cycle forever?
  always @(1) begin
    q <= 0;
  end

  // // in case the above cycles forever and breaks by not compiling or something
  // always @(posedge clk) begin
  //   q <= 0;
  // end
endmodule
