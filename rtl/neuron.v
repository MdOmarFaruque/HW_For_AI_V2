//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.11.2018 17:11:05
// Design Name: 
// Module Name: perceptron
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
//`define DEBUG
`include "include.v"

module neuron #(parameter layerNo=0,neuronNo=0,numWeight=784,dataWidth=16,sigmoidSize=5,weightIntWidth=1,actType="relu",biasNUM=0,weightNUM=0)(
    input        wire   clk,
    input        wire   rst,
    input [dataWidth-1:0]    myinput,
    input    wire       myinputValid,
    input    wire       weightValid,
    input    wire       biasValid,
    input wire [15:0]    weightValue,
    input wire [15:0]    biasValue,
    input wire [15:0]    config_layer_num,
    input wire [15:0]    config_neuron_num,
    output wire [dataWidth-1:0]    out,
    output reg      outvalid   
    );
    
    parameter addressWidth = $clog2(numWeight);
    
    reg         wen;
    wire        ren;
    reg [addressWidth-1:0] w_addr;
    reg [addressWidth:0]   r_addr;//read address has to reach until numWeight hence width is 1 bit more
    reg [dataWidth-1:0]  w_in;
    wire [dataWidth-1:0] w_out;
    reg [2*dataWidth-1:0]  mul; 
    reg [2*dataWidth-1:0]  sum;
    reg [2*dataWidth-1:0]  bias;
    reg [15:0]    biasReg[0:0];
    reg         weight_valid;
    reg         mult_valid;
    wire        mux_valid;
    reg         sigValid; 
    wire [2*dataWidth:0] comboAdd;
    wire [2*dataWidth:0] BiasAdd;
    reg  [dataWidth-1:0] myinputd;
    reg muxValid_d;
    reg muxValid_f;
    reg addr=0;
   //Loading weight values into the momory
    always @(posedge clk)
    begin
        if(rst)
        begin
            w_addr <= {addressWidth{1'b1}};
            wen <=0;
        end
        else if(weightValid & (config_layer_num==layerNo) & (config_neuron_num==neuronNo))
        begin
            w_in <= weightValue;
            w_addr <= w_addr + 1;
            wen <= 1;
        end
        else
            wen <= 0;
    end
	
    assign mux_valid = mult_valid;
    assign comboAdd = mul + sum;
    assign BiasAdd = bias + sum;
    assign ren = myinputValid;
    
	`ifdef pretrained
		initial begin
        case (biasNUM)
            0: $readmemb("b_1_0.mif", biasReg);
            1: $readmemb("b_1_1.mif", biasReg);
            2: $readmemb("b_1_2.mif", biasReg);
            3: $readmemb("b_1_3.mif", biasReg);
            4: $readmemb("b_1_4.mif", biasReg);
            5: $readmemb("b_1_5.mif", biasReg);
            6: $readmemb("b_1_6.mif", biasReg);
            7: $readmemb("b_1_7.mif", biasReg);
            8: $readmemb("b_1_8.mif", biasReg);
            9: $readmemb("b_1_9.mif", biasReg);
            10: $readmemb("b_1_10.mif", biasReg);
            11: $readmemb("b_1_11.mif", biasReg);
            12: $readmemb("b_1_12.mif", biasReg);
            13: $readmemb("b_1_13.mif", biasReg);
            14: $readmemb("b_1_14.mif", biasReg);
            15: $readmemb("b_1_15.mif", biasReg);
            16: $readmemb("b_1_16.mif", biasReg);
            17: $readmemb("b_1_17.mif", biasReg);
            18: $readmemb("b_1_18.mif", biasReg);
            19: $readmemb("b_1_19.mif", biasReg);
            20: $readmemb("b_1_20.mif", biasReg);
            21: $readmemb("b_1_21.mif", biasReg);
            22: $readmemb("b_1_22.mif", biasReg);
            23: $readmemb("b_1_23.mif", biasReg);
            24: $readmemb("b_1_24.mif", biasReg);
            25: $readmemb("b_1_25.mif", biasReg);
            26: $readmemb("b_1_26.mif", biasReg);
            27: $readmemb("b_1_27.mif", biasReg);
            28: $readmemb("b_1_28.mif", biasReg);
            29: $readmemb("b_1_29.mif", biasReg);
            30: $readmemb("b_2_0.mif", biasReg);
            31: $readmemb("b_2_1.mif", biasReg);
            32: $readmemb("b_2_2.mif", biasReg);
            33: $readmemb("b_2_3.mif", biasReg);
            34: $readmemb("b_2_4.mif", biasReg);
            35: $readmemb("b_2_5.mif", biasReg);
            36: $readmemb("b_2_6.mif", biasReg);
            37: $readmemb("b_2_7.mif", biasReg);
            38: $readmemb("b_2_8.mif", biasReg);
            39: $readmemb("b_2_9.mif", biasReg);
            40: $readmemb("b_2_10.mif", biasReg);
            41: $readmemb("b_2_11.mif", biasReg);
            42: $readmemb("b_2_12.mif", biasReg);
            43: $readmemb("b_2_13.mif", biasReg);
            44: $readmemb("b_2_14.mif", biasReg);
            45: $readmemb("b_2_15.mif", biasReg);
            46: $readmemb("b_2_16.mif", biasReg);
            47: $readmemb("b_2_17.mif", biasReg);
            48: $readmemb("b_2_18.mif", biasReg);
            49: $readmemb("b_2_19.mif", biasReg);
            50: $readmemb("b_2_20.mif", biasReg);
            51: $readmemb("b_2_21.mif", biasReg);
            52: $readmemb("b_2_22.mif", biasReg);
            53: $readmemb("b_2_23.mif", biasReg);
            54: $readmemb("b_2_24.mif", biasReg);
            55: $readmemb("b_2_25.mif", biasReg);
            56: $readmemb("b_2_26.mif", biasReg);
            57: $readmemb("b_2_27.mif", biasReg);
            58: $readmemb("b_2_28.mif", biasReg);
            59: $readmemb("b_2_29.mif", biasReg);
            60: $readmemb("b_3_0.mif", biasReg);
            61: $readmemb("b_3_1.mif", biasReg);
            62: $readmemb("b_3_2.mif", biasReg);
            63: $readmemb("b_3_3.mif", biasReg);
            64: $readmemb("b_3_4.mif", biasReg);
            65: $readmemb("b_3_5.mif", biasReg);
            66: $readmemb("b_3_6.mif", biasReg);
            67: $readmemb("b_3_7.mif", biasReg);
            68: $readmemb("b_3_8.mif", biasReg);
            69: $readmemb("b_3_9.mif", biasReg);
            70: $readmemb("b_4_0.mif", biasReg);
            71: $readmemb("b_4_1.mif", biasReg);
            72: $readmemb("b_4_2.mif", biasReg);
            73: $readmemb("b_4_3.mif", biasReg);
            74: $readmemb("b_4_4.mif", biasReg);
            75: $readmemb("b_4_5.mif", biasReg);
            76: $readmemb("b_4_6.mif", biasReg);
            77: $readmemb("b_4_7.mif", biasReg);
            78: $readmemb("b_4_8.mif", biasReg);
            79: $readmemb("b_4_9.mif", biasReg);
		endcase
        end
		always @(posedge clk)
		begin
            bias <= {biasReg[addr][dataWidth-1:0],{dataWidth{1'b0}}};
        end
	`else
		always @(posedge clk)
		begin
			if(biasValid & (config_layer_num==layerNo) & (config_neuron_num==neuronNo))
			begin
				bias <= {biasValue[dataWidth-1:0],{dataWidth{1'b0}}};
			end
		end
	`endif
    
    
    always @(posedge clk)
    begin
        if(rst|outvalid)
            r_addr <= 0;
        else if(myinputValid)
            r_addr <= r_addr + 1;
    end
    
    always @(posedge clk)
    begin
        mul  <= $signed(myinputd) * $signed(w_out);
    end
    
    
    always @(posedge clk)
    begin
        if(rst|outvalid)
            sum <= 0;
        else if((r_addr == numWeight) & muxValid_f)
        begin
            if(!bias[2*dataWidth-1] &!sum[2*dataWidth-1] & BiasAdd[2*dataWidth-1]) //If bias and sum are positive and after adding bias to sum, if sign bit becomes 1, saturate
            begin
                sum[2*dataWidth-1] <= 1'b0;
                sum[2*dataWidth-2:0] <= {2*dataWidth-1{1'b1}};
            end
            else if(bias[2*dataWidth-1] & sum[2*dataWidth-1] &  !BiasAdd[2*dataWidth-1]) //If bias and sum are negative and after addition if sign bit is 0, saturate
            begin
                sum[2*dataWidth-1] <= 1'b1;
                sum[2*dataWidth-2:0] <= {2*dataWidth-1{1'b0}};
            end
            else
                sum <= BiasAdd; 
        end
        else if(mux_valid)
        begin
            if(!mul[2*dataWidth-1] & !sum[2*dataWidth-1] & comboAdd[2*dataWidth-1])
            begin
                sum[2*dataWidth-1] <= 1'b0;
                sum[2*dataWidth-2:0] <= {2*dataWidth-1{1'b1}};
            end
            else if(mul[2*dataWidth-1] & sum[2*dataWidth-1] & !comboAdd[2*dataWidth-1])
            begin
                sum[2*dataWidth-1] <= 1'b1;
                sum[2*dataWidth-2:0] <= {2*dataWidth-1{1'b0}};
            end
            else
                sum <= comboAdd; 
        end
    end
    
    always @(posedge clk)
    begin
        myinputd <= myinput;
        weight_valid <= myinputValid;
        mult_valid <= weight_valid;
        sigValid <= ((r_addr == numWeight) & muxValid_f) ? 1'b1 : 1'b0;
        outvalid <= sigValid;
        muxValid_d <= mux_valid;
        muxValid_f <= !mux_valid & muxValid_d;
    end
    
    
    //Instantiation of Memory for Weights
    Weight_Memory #(.numWeight(numWeight),.neuronNo(neuronNo),.layerNo(layerNo),.addressWidth(addressWidth),.dataWidth(dataWidth),.weightNUM(weightNUM)) WM(
        .clk(clk),
        .wen(wen),
        .ren(ren),
        .wadd(w_addr),
        .radd(r_addr),
        .win(w_in),
        .wout(w_out)
    );
    
	generate
		if(actType == "sigmoid")
		begin:siginst
		//Instantiation of ROM for sigmoid
			Sig_ROM #(.inWidth(sigmoidSize),.dataWidth(dataWidth)) s1(
			.clk(clk),
			.x(sum[2*dataWidth-1-:sigmoidSize]),
			.out(out)
		);
		end
		else
		begin:ReLUinst
			ReLU #(.dataWidth(dataWidth),.weightIntWidth(weightIntWidth)) s1 (
			.clk(clk),
			.x(sum),
			.out(out)
		);
		end
	endgenerate

    
endmodule
