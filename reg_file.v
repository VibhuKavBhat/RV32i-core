module reg_file(
    input       clk,
    input       wr_en,
    input       [4:0] rd_addr1, rd_addr2, wr_addr,
    input       [31:0] wr_data,
    output      [31:0] rd_data1, rd_data2
    );
    
reg [31:0] registers [31:0]; 

/*RISCV standard ISA has 32 registers with bit length being 32. 
In computers and phones however, this bit length is made 64. 

Why? 
The registers themselves are the ones pointing to the address of the RAM. More RAM = More addresses = You need longer registers.*/

integer i;
 
initial begin
    for (i = 1; i < 32; i = i + 1) begin
        registers[i] = 0;
    end
end

// register file write logic (synchronous)
always @(posedge clk) begin
    if (wr_en && (wr_addr != 0)) registers[wr_addr] <= wr_data; //we dont want x0 to accidentally get overwritten, it needs to stay 0
end

// register file read logic (combinational)
//Can add an extra bit of logic here to make sure if x0 is the address, 0 is taken
assign rd_data1 = registers[rd_addr1];
assign rd_data2 = registers[rd_addr2];

endmodule