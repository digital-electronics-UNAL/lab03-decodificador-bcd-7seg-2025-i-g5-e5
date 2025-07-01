module separar_num (
    input  [5:0] num,
    input clk2,
    output reg [3:0] BCD,
    output reg [3:0] sel
);

parameter cont = 1;
reg algo = 0; // Alterna entre las cifras


always @ ( posedge clk2 ) begin
    case (algo)
    0: begin
        BCD <= num%10; algo = 1; // Se usa "<=" ya que es lógica secuencial
        sel <= 4'b1110;
        end
    1: begin
        BCD <= (num- num % 10) / 10; algo=0;
        sel <= 4'b1101;
        end
endcase
end
endmodule

