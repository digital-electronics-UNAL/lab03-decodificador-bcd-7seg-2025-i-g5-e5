module sumayresta_estruc (
  input [3:0] A,
  input [3:0] B,
  input Sel,              // 0 = suma, 1 = resta
  output signed [3:0] S,
  output Cout
);

  wire [3:0] B_mod;       // B modificado según Sel
  
  wire [3:0] Sn;
  
  wire Coutn;

  // XOR para invertir B si Sel=1 (resta)
  assign B_mod[0] = B[0] ^ Sel;
  assign B_mod[1] = B[1] ^ Sel;
  assign B_mod[2] = B[2] ^ Sel;
  assign B_mod[3] = B[3] ^ Sel;

  // Instancia del sumador de 4 bits estructural
  sum4b_estruc suma (
    .A(A),
    .B(B_mod),
    .Ci(Sel),            // Sel = 0 suma directa, Sel = 1 hace B + 1 (complemento a 2)
    .S(Sn),
    .Cout(Coutn)
  );
  
  assign Cout = ~Coutn;
  assign S = ~ Sn;

endmodule