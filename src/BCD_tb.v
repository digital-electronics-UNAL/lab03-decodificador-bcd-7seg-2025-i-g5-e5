always #5 clk2 = ~clk2;
module prueba;

initial begin TEST CASE
$dumpfile ("prueba.vcd");
$dumpvars (-1, uut);
#(3000000) $finish;
end

endmodule

clk2= 0;
rst = 1;
#10 rst = 0;
num = 16´h4321;
end

