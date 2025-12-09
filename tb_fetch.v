`timescale 1ns / 1ps

module tb_fetch;

  
    reg clk;
    reg rst;
    wire [31:0] pc_wire;    
    wire [31:0] instr_wire; 

   
    pc u_pc (
        .clk(clk),
        .rst(rst),
        .pc(pc_wire)        
    );

    
    instr_mem u_imem (
        .instr_addr(pc_wire), 
        .instr(instr_wire)    
    );

   
    always #5 clk = ~clk;

    
    initial begin
        $monitor("Time: %0t | PC: %d | Instr Hex: %h", $time, pc_wire, instr_wire);

        
        clk = 0;
        rst = 1;       
        #10 rst = 0; 

        #50;

        $finish;
    end

endmodule