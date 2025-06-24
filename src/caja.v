module caja (
    input  [5:0] num,
    input clk2,
    input s,
    output reg [0:6] SSeg,
  output Cout
);

wire [3:0] BCD;
  
//   wire [3:0] Sn;
  
//   wire Coutn;



  // Instancias BCD
separar_num suma ( // debe coincidir con el module
    .num(num),
    .clk2(clk2),
    .BCD(BCD)
  );
  
//   assign Cout = ~Coutn;
//   assign S = ~ Sn;

// Instancia BCDtoSSeg

  BCDtoSSeg sumar (
    .BCD(BCD),
    .SSeg(SSeg),
    .an(an)
  );
  

endmodule