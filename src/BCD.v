module separar_num (
    input  [5:0] num,
    input clk2,
    output [3:0] BCD,
);

reg algo = 0;

always @ ( posedge clk2 ) begin
    case (algo)
    0: BCD <= num%10; algo=1; 
    1: BCD <= (num- num % 10) / 10; algo=0;
endcase
end
endmodule