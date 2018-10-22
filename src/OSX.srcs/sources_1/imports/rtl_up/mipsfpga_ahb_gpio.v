// mipsfpga_ahb_gpio.v
//
//
// E-elements' Minisys board:
// Outputs:
// 15 LEDs (IO_LEDR[14:0]) 
// Inputs:
// 15 slide switches (IO_Switch[14:0]), 
// 5 pushbutton switches (IO_PB[4:0])
//


`timescale 100ps/1ps

`include "mipsfpga_ahb_const.vh"


module mipsfpga_ahb_gpio(
    input               HCLK,
    input               HRESETn,
    input      [  3: 0] HADDR,
    input      [ 31: 0] HWDATA,
    input               HWRITE,
    input               HSEL,
    output reg [ 31: 0] HRDATA,

// memory-mapped I/O
    input      [ 17: 0] IO_Switch,
    input      [  4: 0] IO_PB,
    output reg [ 17: 0] IO_LEDR,
    output reg [  8: 0] IO_LEDG,
    output reg [  7: 0] IO_7SEGEN_N, 
    output reg [  6: 0] IO_7SEG_N
);

    wire  [6:0] segments;
    
    reg  [ 7:0] SEGEN_N;
    reg  [ 3:0] SEG0_N, SEG1_N, SEG2_N, SEG3_N, SEG4_N, 
                SEG5_N, SEG6_N, SEG7_N;

    mipsfpga_ahb_sevensegtimer sevensegtimer(.clk(HCLK),    
      .resetn(HRESETn),.EN(SEGEN_N), .DISP0(SEG0_N), .DISP1(SEG1_N), 
      .DISP2(SEG2_N), .DISP3(SEG3_N), .DISP4(SEG4_N), .DISP5(SEG5_N), 
      .DISP6(SEG6_N), .DISP7(SEG7_N), .DISPENOUT(IO_7SEGEN_N), 
      .DISPOUT(IO_7SEG_N));

    always @(posedge HCLK or negedge HRESETn)
       if (~HRESETn) begin
         IO_LEDR <= 18'b0; // Red LEDs
         IO_LEDG <= 9'b0;  // Green LEDs
         SEGEN_N <= 8'hff;
         SEG0_N <= 4'hf;
         SEG1_N <= 4'hf;
         SEG2_N <= 4'hf;
         SEG3_N <= 4'hf;
         SEG4_N <= 4'hf;
         SEG5_N <= 4'hf;
         SEG6_N <= 4'hf;
         SEG7_N <= 4'hf;
       end else if (HWRITE & HSEL)
         case (HADDR)
           `H_LEDR_IONUM:   IO_LEDR <= HWDATA[17:0];
           `H_LEDG_IONUM:   IO_LEDG <= HWDATA[8:0];
           `H_7SEGEN_IONUM: SEGEN_N <= HWDATA[7:0];
           `H_7SEG0_IONUM:  SEG0_N  <= HWDATA[3:0];
           `H_7SEG1_IONUM:  SEG1_N  <= HWDATA[3:0];
           `H_7SEG2_IONUM:  SEG2_N  <= HWDATA[3:0];
           `H_7SEG3_IONUM:  SEG3_N  <= HWDATA[3:0];
           `H_7SEG4_IONUM:  SEG4_N  <= HWDATA[3:0];
           `H_7SEG5_IONUM:  SEG5_N  <= HWDATA[3:0];
           `H_7SEG6_IONUM:  SEG6_N  <= HWDATA[3:0];
           `H_7SEG7_IONUM:  SEG7_N  <= HWDATA[3:0];
         endcase

    always @(*)
      case (HADDR)
        `H_SW_IONUM:       HRDATA = {14'b0, IO_Switch};
        `H_PB_IONUM:       HRDATA = {27'b0, IO_PB};
        default:           HRDATA = 32'h00000000;
      endcase

endmodule

