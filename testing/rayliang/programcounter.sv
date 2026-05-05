module programcounter (
    input logic         clk,
    input logic         reset,
    input logic         branch_taken,
    input logic         pause,
    input logic [31:0] branch_target,
    output logic [31:0] pc_out
);

    always_ff @(posedge clk) begin
        if (reset)
            pc_out <= 32'd0; // reset to 0
        else if (pause)
            pc_out <= pc_out; // holds value
        else if (branch_taken)
            pc_out <= branch_target; // takes branch position
        else
            pc_out <= pc_out + 32'd4; // adds 4 to current position
    end
endmodule 

// please add comments if needed