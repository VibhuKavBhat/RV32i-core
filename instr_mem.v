module instr_mem (
    input       [31:0] instr_addr,
    output      [31:0] instr
);


reg [31:0] instr_ram [0:511];


initial begin
    $readmemh("rv32i_test.txt", instr_ram); 
end


assign instr = instr_ram[instr_addr[31:2]];

endmodule