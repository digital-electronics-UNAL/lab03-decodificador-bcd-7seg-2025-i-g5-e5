 module sum4b_estruc (
  input  [3:0] A,
  input  [3:0] B,
  input        Ci,
  output [3:0] S,
  output       Cout
);

  wire c1, c2, c3;

  sum1b_estruc FA0 (
    .A   (A[0]),
    .B   (B[0]),
    .Ci  (Ci),
    .S   (S[0]),
    .Cout(c1)
  );

  sum1b_estruc FA1 (
    .A   (A[1]),
    .B   (B[1]),
    .Ci  (c1),
    .S   (S[1]),
    .Cout(c2)
  );

  sum1b_estruc FA2 (
    .A   (A[2]),
    .B   (B[2]),
    .Ci  (c2),
    .S   (S[2]),
    .Cout(c3)
  );

  sum1b_estruc FA3 (
    .A   (A[3]),
    .B   (B[3]),
    .Ci  (c3),
    .S   (S[3]),
    .Cout(Cout)
  );

endmodule