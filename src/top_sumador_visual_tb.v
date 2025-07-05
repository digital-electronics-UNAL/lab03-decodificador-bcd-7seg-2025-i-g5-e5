`timescale 1ns/1ps

`include "src/top_sumador_visual.v"
`include "src/caja.v"
`include "src/BCD.v"
`include "src/BCDtoSSeg.v"
`include "src/sumayresta_estruc.v"
`include "src/sum4b_estruc.v"
`include "src/sum1b_estruc.v"
`include "src/clock_gen.v"

module top_sumador_visual_tb;

  // Entradas
  reg [3:0] A_tb;
  reg [3:0] B_tb;
  reg Sel_tb;
  reg clk_tb;
  reg [3:0] s_tb;

  // Salidas
  wire [0:6] SSeg_tb;
  wire [3:0] an_tb;

  // Instancia del módulo superior
  top_sumador_visual uut (
    .A(A_tb),
    .B(B_tb),
    .Sel(Sel_tb),
    .clk(clk_tb),       // ahora clk_tb es la entrada principal
    .s(s_tb),
    .SSeg(SSeg_tb),
    .an(an_tb)
  );

  // Reloj principal (simula 100 MHz)
  always #5 clk_tb = ~clk_tb;

  // Secuencia de activación de displays
  initial begin
    s_tb = 4'b1110;
    forever #40 s_tb = {s_tb[2:0], s_tb[3]};
  end

  // Estímulos
  initial begin
    clk_tb = 0;

    A_tb = 4'd7;  B_tb = 4'd1;  Sel_tb = 0; #200; // 7 + 1 = 8
    A_tb = 4'd6;  B_tb = 4'd4;  Sel_tb = 0; #200; // 6 + 4 = 10
    A_tb = 4'd5;  B_tb = 4'd3;  Sel_tb = 1; #200; // 5 - 3 = 2
    A_tb = 4'd2;  B_tb = 4'd5;  Sel_tb = 1; #200; // 2 - 5 = -3
    A_tb = 4'd0;  B_tb = 4'd8;  Sel_tb = 1; #200; // 0 - 8 = -8
    A_tb = 4'd15; B_tb = 4'd1;  Sel_tb = 0; #200; // 15 + 1 = 16

    $finish;
  end

  // Archivo para GTKWave
  initial begin
    $dumpfile("top_sumador_visual_tb.vcd");
    $dumpvars(-1, uut);
  end

endmodule
