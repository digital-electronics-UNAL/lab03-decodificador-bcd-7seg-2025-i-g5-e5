module clock gen (clk, reset, fdiv);

input clk;
input reset;
output reg fdiv;

parameter cont = 25000000;
parameter tam = $clog2(cont);

reg [tam:0] counter;


always @(posedge clk) begin
    if(reset==0) begin
        counter <='d0; // Nota: ctrl+shft + u + 27 = 
        clk2 <= 'd0;
    end else begin
        if (counter == cont) begin
            counter <= 'd0;
            // clk2 <= ~ // Nota: ctrl+shft + u + 7E = 
        end
    end
end