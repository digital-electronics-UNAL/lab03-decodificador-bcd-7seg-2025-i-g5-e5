`timescale 1ns/1ps
`include "src/caja.v"
`include "src/BCD.v"
`include "src/BCDtoSSeg.v"
module caja_tb;

  // Entradas
  reg [5:0] num_tb;
  reg clk2_tb;

  // Salidas
  wire [0:6] SSeg_tb;
  wire Cout;

  // Instancia del módulo bajo prueba
  caja uut (
    .num(num_tb),
    .clk2(clk2_tb),
    .SSeg(SSeg_tb),
    .Cout(Cout_tb)
  );

  // Generación del reloj: período 10ns (100MHz)
  always #5 clk2_tb = ~clk2_tb;

  // Estímulos
  initial begin
    clk2_tb = 0;
    num_tb = 0;     #100;
    num_tb = 17;    #100;
    num_tb = 35;    #100;
    num_tb = 42;    #100;
    num_tb = 59;    #100;
    num_tb = 6'd12; #100;
    $finish;
  end

  // Archivo VCD para GTKWave
  initial begin
    $dumpfile("caja_tb.vcd");
    $dumpvars(-1, uut);
  end

endmodule
