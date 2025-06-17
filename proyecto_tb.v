`include "pruebapro.v"
`timescale 1ps / 1ps

module proyecto_tb;

    reg clk;
    reg rst;
    reg echo;
    wire trigger;
    wire [15:0] distancia_cm;

    // Instancia del DUT (Device Under Test)
    sensor_ultrasonico uut (
        .clk(clk),
        .rst(rst),
        .echo(echo),
        .trigger(trigger),
        .distancia_cm(distancia_cm)
    );

    // Generador de reloj: 50 MHz = 20 ns = 20000 ps
    always #10000 clk = ~clk;

    initial begin
        $display("Iniciando simulación...");
        $dumpfile("sensor_ultrasonico.vcd");
        $dumpvars(0, proyecto_tb);

        clk = 0;
        rst = 1;
        echo = 0;

        #50000;   // Esperar 50.000 ps (50 ns)
        rst = 0;

        // Esperar a que trigger se active
        wait(trigger == 1);
        $display("Trigger ON @ %t", $time);

        wait(trigger == 0);
        $display("Trigger OFF @ %t", $time);

        // Generar pulso de eco correspondiente a 100 cm
        // Para 100 cm → tiempo ida y vuelta ≈ 5.8 us ≈ 5800000 ps
        #500;
        echo = 1;
        #5800000;
        echo = 0;

        // Esperar que se calcule la distancia
        #1000000;

        $display("Distancia medida: %d cm", distancia_cm);

        $stop;
    end

endmodule

 // initial begin
  //  $dumpfile("proyecto_tb.vcd");
   // $dumpvars(-1, dut);
   // #60 $finish; 
 // end


