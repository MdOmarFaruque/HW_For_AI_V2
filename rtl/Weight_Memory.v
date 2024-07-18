//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.02.2019 17:25:12
// Design Name: 
// Module Name: Weight_Memory
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
`include "include.v"

module Weight_Memory #(parameter numWeight = 3, neuronNo=5,layerNo=1,addressWidth=10,dataWidth=16,weightNUM=0) 
    ( 
    input wire clk,
    input wire wen,
    input wire ren,
    input wire [addressWidth-1:0] wadd,
    input wire [addressWidth-1:0] radd,
    input wire [dataWidth-1:0] win,
    output reg [dataWidth-1:0] wout);
    
    reg [dataWidth-1:0] mem [numWeight-1:0];

    `ifdef pretrained
        initial
		begin
	        case (weightNUM)
            0: $readmemb("w_1_0.mif", mem);
            1: $readmemb("w_1_1.mif", mem);
            2: $readmemb("w_1_2.mif", mem);
            3: $readmemb("w_1_3.mif", mem);
            4: $readmemb("w_1_4.mif", mem);
            5: $readmemb("w_1_5.mif", mem);
            6: $readmemb("w_1_6.mif", mem);
            7: $readmemb("w_1_7.mif", mem);
            8: $readmemb("w_1_8.mif", mem);
            9: $readmemb("w_1_9.mif", mem);
            10: $readmemb("w_1_10.mif", mem);
            11: $readmemb("w_1_11.mif", mem);
            12: $readmemb("w_1_12.mif", mem);
            13: $readmemb("w_1_13.mif", mem);
            14: $readmemb("w_1_14.mif", mem);
            15: $readmemb("w_1_15.mif", mem);
            16: $readmemb("w_1_16.mif", mem);
            17: $readmemb("w_1_17.mif", mem);
            18: $readmemb("w_1_18.mif", mem);
            19: $readmemb("w_1_19.mif", mem);
            20: $readmemb("w_1_20.mif", mem);
            21: $readmemb("w_1_21.mif", mem);
            22: $readmemb("w_1_22.mif", mem);
            23: $readmemb("w_1_23.mif", mem);
            24: $readmemb("w_1_24.mif", mem);
            25: $readmemb("w_1_25.mif", mem);
            26: $readmemb("w_1_26.mif", mem);
            27: $readmemb("w_1_27.mif", mem);
            28: $readmemb("w_1_28.mif", mem);
            29: $readmemb("w_1_29.mif", mem);
            30: $readmemb("w_2_0.mif", mem);
            31: $readmemb("w_2_1.mif", mem);
            32: $readmemb("w_2_2.mif", mem);
            33: $readmemb("w_2_3.mif", mem);
            34: $readmemb("w_2_4.mif", mem);
            35: $readmemb("w_2_5.mif", mem);
            36: $readmemb("w_2_6.mif", mem);
            37: $readmemb("w_2_7.mif", mem);
            38: $readmemb("w_2_8.mif", mem);
            39: $readmemb("w_2_9.mif", mem);
            40: $readmemb("w_2_10.mif", mem);
            41: $readmemb("w_2_11.mif", mem);
            42: $readmemb("w_2_12.mif", mem);
            43: $readmemb("w_2_13.mif", mem);
            44: $readmemb("w_2_14.mif", mem);
            45: $readmemb("w_2_15.mif", mem);
            46: $readmemb("w_2_16.mif", mem);
            47: $readmemb("w_2_17.mif", mem);
            48: $readmemb("w_2_18.mif", mem);
            49: $readmemb("w_2_19.mif", mem);
            50: $readmemb("w_2_20.mif", mem);
            51: $readmemb("w_2_21.mif", mem);
            52: $readmemb("w_2_22.mif", mem);
            53: $readmemb("w_2_23.mif", mem);
            54: $readmemb("w_2_24.mif", mem);
            55: $readmemb("w_2_25.mif", mem);
            56: $readmemb("w_2_26.mif", mem);
            57: $readmemb("w_2_27.mif", mem);
            58: $readmemb("w_2_28.mif", mem);
            59: $readmemb("w_2_29.mif", mem);
            60: $readmemb("w_3_0.mif", mem);
            61: $readmemb("w_3_1.mif", mem);
            62: $readmemb("w_3_2.mif", mem);
            63: $readmemb("w_3_3.mif", mem);
            64: $readmemb("w_3_4.mif", mem);
            65: $readmemb("w_3_5.mif", mem);
            66: $readmemb("w_3_6.mif", mem);
            67: $readmemb("w_3_7.mif", mem);
            68: $readmemb("w_3_8.mif", mem);
            69: $readmemb("w_3_9.mif", mem);
            70: $readmemb("w_4_0.mif", mem);
            71: $readmemb("w_4_1.mif", mem);
            72: $readmemb("w_4_2.mif", mem);
            73: $readmemb("w_4_3.mif", mem);
            74: $readmemb("w_4_4.mif", mem);
            75: $readmemb("w_4_5.mif", mem);
            76: $readmemb("w_4_6.mif", mem);
            77: $readmemb("w_4_7.mif", mem);
            78: $readmemb("w_4_8.mif", mem);
            79: $readmemb("w_4_9.mif", mem);
	    endcase
        end
	`else
		always @(posedge clk)
		begin
			if (wen)
			begin
				mem[wadd] <= win;
			end
		end 
    `endif
    
    always @(posedge clk)
    begin
        if (ren)
        begin
            wout <= mem[radd];
        end
    end 
endmodule
