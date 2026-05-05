// This is the top level module that integrates all of the core, control,
// dispatch, and memory controllers within the GPU.

module GPU (
    input logic clk,
    input logic reset
);

    // Register File:
    logic [3:0]  write_address;
    logic [31:0] write_data;
    logic        write_enable;
    logic [3:0]  read_address_1;
    logic [31:0] read_data_1;
    logic [3:0]  read_address_2;
    logic [31:0] read_data_2;

    regfile register_file (
        .clk           (clk),
        .reset         (reset),
        .write_address (write_address),
        .write_data    (write_data),
        .write_enable  (write_enable),
        .read_address_1(read_address_1),
        .read_data_1   (read_data_1),
        .read_address_2(read_address_2),
        .read_data_2   (read_data_2)
    );

    // Program Counter:
    logic [31:0] pc;
    logic        running;
    logic        pause;
    logic        branch_taken;
    logic [31:0] branch_target;

    program_counter pc_unit (
        .clk          (clk),
        .reset        (reset),
        .running      (running),
        .pause        (pause),
        .branch_taken (branch_taken),
        .branch_target(branch_target),
        .pc           (pc)
    );

    // Memory Load/Store:
    // reg_data_in  : data from the register file to be stored into memory
    // reg_data_out : data loaded from memory, written back into the register file
    // A writeback mux will be needed here once the ALU is integrated,
    // so that write_data can select between an ALU result and a memory load.
    logic [3:0] mem_address;
    logic       mem_write_enable;
    logic       mem_read_enable;

    mem_load_store mem_controller (
        .clk             (clk),
        .reset           (reset),
        .reg_address     (mem_address),
        .reg_data_in     (read_data_1),
        .reg_data_out    (write_data),
        .mem_write_enable(mem_write_enable),
        .mem_read_enable (mem_read_enable)
    );

    // Additional modules (ALU, control/decode, dispatch) would be instantiated
    // here and connected accordingly.

endmodule
