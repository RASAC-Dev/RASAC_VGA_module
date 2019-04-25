`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Brian
// 
// Create Date: 04/24/2019 05:09:29 AM
// Design Name: 
// Module Name: top
// Project Name: 
// Target Devices: RASAC 0.9v
// Tool Versions: 
// Description: Top module for RASAC VGA module.
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top(
        input clk,
        output vga_hs,
        output vga_vs,
        output [3:0] vga_r,
        output [3:0] vga_g,
        output [3:0] vga_b,
        output reg led
    );
    
    // Generate clocks
    wire counter_clk, vga_clk;
    clk_gen myclk(
        .clk_in(clk),
        .counter_clk(counter_clk),
        .vga_clk(vga_clk)
    );
    
    // VGA wires n stuff
    reg [3:0] r;
    reg [3:0] g;
    reg [3:0] b;
    assign vga_r = r;
    assign vga_g = g;
    assign vga_b = b;
    
    vga my_vga(
        .clk(vga_clk),
        .hsync(vga_hs),
        .vsync(vga_vs),
        .r(vga_r),
        .g(vga_g),
        .b(vga_b)
    );
    
    // Blink
    reg [24:0] counter;
    initial begin
        counter = 0;
        led = 0;
    end
    
    always @ (posedge counter_clk) begin
        if (counter == 0) begin
            counter <= 2499999; // Approx. 1Hz with 5 MHz counter_clk
            led <= ~led;
        end else begin
            counter <= counter - 1;
        end
    end
endmodule
