module pc(
    input clk,rst,
    output  reg [31:0]pc
);
           
    always @(posedge clk, posedge rst) begin
        if (rst) pc <= 32'h0;
        else pc <= pc + 4; // Ideally this isn't hardcoded. I'll change it later
    end
    
endmodule
