`include "register.v"

/*************************
 ** register test bench **
 *************************/

module testregister();

  // Instantiate test vars
  wire [31:0] q;
  wire [31:0] qzero;
  reg [31:0]  d;
  reg         wrenable;
  reg         clk;

  // Instantiate helper vars
  reg testregpassed = 1;
  reg testregzeropassed = 1;
  reg [7:0] value = 147980200;
  reg [7:0] value1 = 153000324;

  // Instantiate DUTs
  register32 testreg(.q(q),
                     .d(d),
                     .wrenable(wrenable),
                     .clk(clk));
  register32zero testregzero(
                     .q(qzero),
                     .d(d),
                     .wrenable(wrenable),
                     .clk(clk));

  // Generate clock
  initial clk = 0;
  always #10 clk = !clk;

  initial begin
    $display("Begin testing register32, register32zero");

    // Test writing some value
    d=value;wrenable=1; #40
    if (q !== value) begin
      $display("Test write to register32 failed");
      $display("Expected: %b", d);
      $display("Actual:   %b", q);
      testregpassed = 0;
    end
    if (qzero !== 32'b0) begin
      $display("Test write to register32 failed");
      $display("Expected: %b", 32'b0);
      $display("Actual:   %b", qzero);
      testregzeropassed = 0;
    end

    // Test wrenable (with some other val)
    wrenable=0;
    d=value1; #40
    if (q !== value) begin
      $display("Test don't write to register32 failed");
      $display("Expected: %b", value);
      $display("Actual:   %b", q);
      testregpassed = 0;
    end
    if (qzero !== 32'b0) begin
      $display("Test don't write to register32 failed");
      $display("Expected: %b", 32'b0);
      $display("Actual:   %b", qzero);
      testregzeropassed = 0;
    end

    // More tests

    // Show if tests passed
    if (testregpassed) begin
      $display("register32 tests passed");
    end
    if (testregzeropassed) begin
      $display("register32zero tests passed");
    end
    if (testregpassed ~| testregzeropassed) begin
      $display("Tests complete");
    end

    $finish();
  end
endmodule
