`timescale 1ns/1ps
`include "src/simon.v"  

module simon_tb;

  // Entradas
  reg clk;
  reg rst;
  reg [3:0] btn;

  // Salidas
  wire [3:0] led;
  wire sound;

  // Parámetro de simulación
  wire [15:0] ticks_per_milli = 16'd50; // Simulación rápida

  // Instancia del módulo simon
  simon dut (
    .clk(clk),
    .rst(rst),
    .ticks_per_milli(ticks_per_milli),
    .btn(btn),
    .led(led),
    .sound(sound)
  );

  // Generación de reloj
  always #10 clk = ~clk;

  // Simulación
  initial begin
    // Inicialización
    clk = 0;
    rst = 1;
    btn = 4'b0000;
    #100;
    rst = 0;

    // Espera un tiempo y presiona un botón para iniciar
    #1000;
    btn = 4'b0001;  // presionar botón 0
    #100;
    btn = 4'b0000;

    // Espera a que el juego reproduzca la secuencia
    #50000;

    // Suponiendo que la primera secuencia es [0] (esto depende del generador interno)
    // Simular respuesta del jugador con botón 0:
    btn = 4'b0001;  #100;
    btn = 4'b0000;  #10000;

    // Esperar avance de nivel
    #100000;

    // Segundo intento (suponiendo nueva secuencia es [0,1])
    btn = 4'b0001;  #100;
    btn = 4'b0000;  #10000;
    btn = 4'b0010;  #100;
    btn = 4'b0000;

    // Fin de prueba
    #200000;
    $finish;
  end

  // Dump para GTKWave
  initial begin
    $dumpfile("simon_tb.vcd");
    $dumpvars(0, simon_tb);
  end

endmodule
