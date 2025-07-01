module clock_gen (clk, reset, fdiv);

input clk;
input reset;
output reg clk2;

parameter cont = 800000;
parameter tam = $clog2(cont);

reg [tam:0] counter;

initial begin
    clk2 = 1'b0;
    counter = 'd0;
end


always @(posedge clk) begin
    if(reset==0) begin
        counter <='d0; // Nota: ctrl+shft + u + 27 = 
        clk2 <= 'd0;
    end else begin
        if (counter == cont) begin
            counter <= 'd0;
            clk2 <= ~clk2;
        end else begin
            counter <= counter + 1;
        end
    end
end

endmodule