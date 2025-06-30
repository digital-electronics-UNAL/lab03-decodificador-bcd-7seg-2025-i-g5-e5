`timescale 1ns/1ps

`include "src/top_sumador_visual.v"
`include "src/caja.v"
`include "src/BCDtoSSeg.v"
`include "src/BCD.v"
`include "src/sumayresta_estruc.v"
`include "src/sum4b_estruc.v"
`include "src/sum1b_estruc.v"


module top_sumador_visual_tb;

  // Entradas
  reg [3:0] A_tb;
  reg [3:0] B_tb;
  reg Sel_tb;
  reg clk2_tb;
  reg [3:0] s_tb;

  // Salidas
  wire [0:6] SSeg_tb;
  wire [3:0] an_tb;

  // Instancia del módulo superior
  top_sumador_visual uut (
    .A(A_tb),
    .B(B_tb),
    .Sel(Sel_tb),
    .clk2(clk2_tb),
    .s(s_tb),
    .SSeg(SSeg_tb),
    .an(an_tb)
  );

  // Generación del reloj: 10 ns de periodo
  always #5 clk2_tb = ~clk2_tb;

//   // Rueda de multiplexación de displays
//   initial begin
//     s_tb = 4'b1110;
//     forever #40 s_tb = {s_tb[2:0], s_tb[3]}; // Rota el display activo
//   end

  // Estímulos
  initial begin
    clk2_tb = 0;
    
    A_tb = 4'd7; B_tb = 4'd1; Sel_tb = 0; #100;  // 7 + 1 = 8
    A_tb = 4'd6; B_tb = 4'd4; Sel_tb = 0; #100;  // 6 + 4 = 10
    A_tb = 4'd5; B_tb = 4'd3; Sel_tb = 1; #100;  // 5 - 3 = 2
    A_tb = 4'd2; B_tb = 4'd5; Sel_tb = 1; #100;  // 2 - 5 = -3
    A_tb = 4'd0; B_tb = 4'd8; Sel_tb = 1; #100;  // 0 - 8 = -8
    A_tb = 4'd15; B_tb = 4'd1; Sel_tb = 0; #100; // 15 + 1 = 16

    $finish;
  end

  // Archivo de simulación para GTKWave
  initial begin
    $dumpfile("top_sumador_visual_tb.vcd");
    $dumpvars(-1, uut);
  end

endmodule
