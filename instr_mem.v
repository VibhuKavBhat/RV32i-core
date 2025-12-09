module instr_mem (
    input       [31:0] instr_addr,
    output      [31:0] instr
);


reg [31:0] instr_ram [0:511]; //Change this to accomodate more instructions in the future


initial begin
    $readmemh("rv32i_test.txt", instr_ram); //this txt file is placed in the simulation sources for future reference
end


assign instr = instr_ram[instr_addr[31:2]]; 
//We dont actually need [31:2] PC's because we only have 512 slots. It's easier for debugging though so let it stay for now

endmodule