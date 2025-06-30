module top_sumador_visual (
    input [3:0] A,
    input [3:0] B,
    input Sel,              // 0 = suma, 1 = resta
    input clk2,
    input [3:0] s,
    output [0:6] SSeg,
    output [3:0] an
);

  wire signed [3:0] S_raw;
  wire [5:0] num_abs;

  // Resultado de la operación suma/resta
  sumayresta_estruc alu (
    .A(A),
    .B(B),
    .Sel(Sel),
    .S(S_raw),
    .Cout()       // Puedes conectarlo si lo necesitas
  );

  // Convertir el resultado a número positivo (valor absoluto)
  assign num_abs = (S_raw < 0) ? -S_raw : S_raw;

  // Visualización del número (sin signo)
  caja display_unit (
    .num(num_abs),
    .clk2(clk2),
    .s(s),
    .SSeg(SSeg),
    .an(an)
  );

endmodule
