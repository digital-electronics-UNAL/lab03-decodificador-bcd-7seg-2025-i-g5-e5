`timescale 1ns/1ps

`include "src/caja.v"
`include "src/BCD.v"
`include "src/BCDtoSSeg.v"

module caja_tb;

  // Entradas
  reg [5:0] num_tb;
  reg clk2_tb;
  reg [3:0] s_tb;  // señal para los ánodos

  // Salidas
  wire [0:6] SSeg_tb;
  wire [3:0] an_tb;

  // Instancia del módulo bajo prueba
  caja uut (
    .num(num_tb),
    .clk2(clk2_tb),
    .s(s_tb),
    .SSeg(SSeg_tb),
    .an(an_tb)
  );

  // Generación del reloj: período 10ns (100MHz)
  always #5 clk2_tb = ~clk2_tb;

  // Multiplexor de ánodos: va activando cada uno cada 40ns
  initial begin
    s_tb = 4'b1110;
    forever begin
      #40 s_tb = {s_tb[2:0], s_tb[3]}; // Rotación circular
    end
  end

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

