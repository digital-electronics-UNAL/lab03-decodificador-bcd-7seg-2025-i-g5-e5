module sum1b_estruc (
    input A, 
    input B, 
    input Ci,
    output Cout,
    output S
  );
  // creo cables internos para conectar compuertas lógicas.
    wire a_ab; // compuerta and entre a y b
    wire x_ab; // compuerta xor entre a y b
    wire cout_t; 
  
    and(a_ab,A,B); // Esto es una compuerta AND entre A y B. Guarda el resultado en a_ab.
    xor(S,x_ab,Ci);
    xor(x_ab,A,B);
    and(cout_t,x_ab,Ci);
    or (Cout,cout_t,a_ab);
  
  endmodule