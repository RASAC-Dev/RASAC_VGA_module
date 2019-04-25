`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Brian
// 
// Create Date: 04/25/2019 03:39:07 AM
// Design Name: 
// Module Name: shapes
// Project Name: 
// Target Devices: RASAC 0.9v
// Tool Versions: 
// Description: Calculates pixels to draw shapes on screen.
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module shapes(
    output wire [3:0] r,
    output wire [3:0] g,
    output wire [3:0] b,
    input wire [9:0] x,
    input wire [8:0] y,
    input wire clk
    );
    
    // Square A Color
    reg [11:0] sq_a;
    initial sq_a = 12'hfa4;
    
    // Square A Position
    reg [9:0] a_xi;
    reg [9:0] a_yi;
    reg [9:0] a_xj;
    reg [9:0] a_yj;
    initial a_xi = 100;
    initial a_yi = 200;
    initial a_xj = 200;
    initial a_yj = 300;
    
    // Calculate RGB values
    assign r = ((x > a_xi) && (x < a_xj) && (y > a_yi) && (y < a_yj)) ? sq_a[11:8] : 0;
    assign g = ((x > a_xi) && (x < a_xj) && (y > a_yi) && (y < a_yj)) ? sq_a[7:4] : 0;
    assign b = ((x > a_xi) && (x < a_xj) && (y > a_yi) && (y < a_yj)) ? sq_a[3:0] : 0;
    
endmodule
