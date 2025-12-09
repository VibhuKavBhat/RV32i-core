module data_mem #(parameter MEM_SIZE = 512) (
    input clk,
    input wr_en,
    input [31:0] wr_addr,
    input [31:0] wr_data,
    output [31:0] rd_data_mem
);

    
    reg [31:0] data_ram [0:MEM_SIZE-1];
    wire [31:0]word_addr = {2'b0,wr_addr[31:2]}; 
    
    /*wr_addr will point to every byte in the RAM, we need it to point to every word. 
    (A word has 4 bytes). Hence we neglect the last two bits. The concatenations is just
    a better design practice to make everything neater.*/
    
    integer i;
initial begin
    for (i = 0; i < MEM_SIZE; i = i + 1)
        data_ram[i] = 32'b0;   

end
    // Combinational read logic
    assign rd_data_mem = data_ram[word_addr];

    // Synchronous write logic
    always @(posedge clk) begin
        if (wr_en) begin
            data_ram[word_addr] <= wr_data;
        end
    end
endmodule
