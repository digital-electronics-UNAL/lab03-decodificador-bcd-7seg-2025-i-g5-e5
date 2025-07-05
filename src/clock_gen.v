module clock_gen (
  input clk,
  output reg clk2 = 0
);

  reg [15:0] count = 0;
  parameter DIV = 50000;

  always @(posedge clk) begin
    if (count >= DIV) begin
      count <= 0;
      clk2 <= ~clk2;
    end else begin
      count <= count + 1;
    end
  end

endmodule
