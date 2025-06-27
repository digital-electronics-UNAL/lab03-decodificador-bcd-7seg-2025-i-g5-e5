module caja (
    input [5:0] num,
    input clk2,
    input [3:0] s,
    output [0:6] SSeg,
    output [3:0] an
);

  wire [3:0] BCD;

  // Instancia de módulo que separa el número en dígitos
  separar_num suma (
    .num(num),
    .clk2(clk2),
    .BCD(BCD)
  );

  // Instancia del decodificador BCD a 7 segmentos
  BCDtoSSeg sumar (
    .BCD(BCD),
    .s(s),          // señal para multiplexación externa
    .SSeg(SSeg),
    .an(an)
  );

endmodule
