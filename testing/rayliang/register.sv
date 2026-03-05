module register (
    input logic [15:0] in,
    input logic [3:0] sel,
    output logic out
);

logic [7:0] layer1 
logic [3:0] layer2
logic [1:0] layer3

assign layer1[0] = (!sel[0]:in[0] | sel[0]:in[1]);
assign layer1[1] = (!sel[0]:in[2] | sel[0]:in[3]);
assign layer1[2] = (!sel[0]:in[4] | sel[0]:in[5]);
assign layer1[3] = (!sel[0]:in[6] | sel[0]:in[7]);
assign layer1[4] = (!sel[0]:in[8] | sel[0]:in[9]);
assign layer1[5] = (!sel[0]:in[10] | sel[0]:in[11]);
assign layer1[6] = (!sel[0]:in[12] | sel[0]:in[13]);
assign layer1[7] = (!sel[0]:in[14] | sel[0]:in[15]);

assign layer2[0] = (!sel[1]:layer1[0] | sel[1]:layer1[1]);
assign layer2[1] = (!sel[1]:layer1[2] | sel[1]:layer1[3]);
assign layer2[2] = (!sel[1]:layer1[4] | sel[1]:layer1[5]);
assign layer2[3] = (!sel[1]:layer1[6] | sel[1]:layer1[7]);

assign layer3[0] = (!sel[2]:layer2[0] | sel[2]:layer2[1]);
assign layer3[1] = (!sel[2]:layer2[2] | sel[2]:layer2[3]);
assign out = (!sel[3]:layer3[0] | sel[3]:layer3[1]);



endmodule