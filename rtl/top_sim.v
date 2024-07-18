`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.04.2019 15:57:43
// Design Name: 
// Module Name: top_sim
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

`define MaxTestSamples 1

module top_sim(

    );
    
    reg reset;
    reg clock;
    reg [`dataWidth-1:0] in;
    reg in_valid;
    reg [`dataWidth-1:0] in_mem [784:0];
    reg [7:0] fileName[23:0];
    reg s_axi_awvalid;
    reg [31:0] s_axi_awaddr;
    wire s_axi_awready;
    reg [31:0] s_axi_wdata;
    reg s_axi_wvalid;
    wire s_axi_wready;
    wire s_axi_bvalid;
    reg s_axi_bready;
    wire intr;
    wire [15:0] axiRdData;
    reg [31:0] s_axi_araddr;
    wire [31:0] s_axi_rdata;
    reg s_axi_arvalid;
    wire s_axi_arready;
    wire s_axi_rvalid;
    reg s_axi_rready;
    reg [`dataWidth-1:0] expected;
    wire [3:0] digit;
    
   
    //Testing pins
    wire [15:0]  config_layer_num1;
    wire [15:0]  config_neuron_num1;
    wire [15:0] weightValue1;
    wire [15:0] biasValue1;
    wire [15:0] out_data_11;
    wire out_valid1;
    wire weightValid1;
    wire biasValid1;

    wire [15:0] numNeurons[15:1];
    wire [15:0] numWeights[15:1];
    
    assign numNeurons[1] = 30;
    assign numNeurons[2] = 30;
    assign numNeurons[3] = 10;
    assign numNeurons[4] = 10;
    
    assign numWeights[1] = 784;
    assign numWeights[2] = 30;
    assign numWeights[3] = 30;
    assign numWeights[4] = 10;
    
    integer right=0;
    integer wrong=0;
    
    zyNet dut(
    .clk(clock),
    .reset(reset),
    .axis_in_data(in),
    .axis_in_data_valid(in_valid),

    .digit(digit),
   
    .intr(intr)
    );
    
            
    initial
    begin
        clock = 1'b0;
       
    end
        
    always
        #5 clock = ~clock;
    
    function [7:0] to_ascii;
      input integer a;
      begin
        to_ascii = a+48;
      end
    endfunction
    
   
    
    
   
        
    
    task sendData();
    //input [25*7:0] fileName;
    integer t;
    begin
        $readmemb("test_data_0017.txt", in_mem);
        @(posedge clock);
        @(posedge clock);
        @(posedge clock);
        for (t=0; t <784; t=t+1) begin
            @(posedge clock);
            in <= in_mem[t];
            in_valid <= 1;
             $display("IN= %0b. ",in_mem[t]);
             $display("Valid= %h, Wight: %h,",weightValid1,weightValue1);
            //@(posedge clock);
            //in_valid <= 0;
        end 
        @(posedge clock);
        in_valid <= 0;
        expected = in_mem[t];
    end
    endtask
   
    integer i,j,layerNo=1,k;
    integer start;
    integer testDataCount;
    integer testDataCount_int;
    initial
    begin
        reset = 1;
        in_valid = 0;
        #100;
        reset = 0;
        #100
        
        start = $time;
        `ifndef pretrained
            configWeights();
            configBias();
        `endif
        $display("Configuration completed",,,,$time-start,,"ns");
        start = $time;
        for(testDataCount=0;testDataCount<`MaxTestSamples;testDataCount=testDataCount+1)
        begin
            testDataCount_int = testDataCount;
            fileName[0] = "t";
            fileName[1] = "x";
            fileName[2] = "t";
            fileName[3] = ".";
            fileName[4] = "0";
            fileName[5] = "0";
            fileName[6] = "0";
            fileName[7] = "0";
            i=0;
            while(testDataCount_int != 0)
            begin
                fileName[i+4] = to_ascii(testDataCount_int%10);
                testDataCount_int = testDataCount_int/10;
                i=i+1;
            end 
            fileName[8] = "_";
            fileName[9] = "a";
            fileName[10] = "t";
            fileName[11] = "a";
            fileName[12] = "d";
            fileName[13] = "_";
            fileName[14] = "t";
            fileName[15] = "s";
            fileName[16] = "e";
            fileName[17] = "t";
            sendData();
            @(posedge intr);
            @(posedge  clock);
            @(posedge  clock);
            //readAxi(24);
            //$display("Status: %0x",axiRdData);
            
           // assign axiRdData = {28'b0,digit};
            
            if({28'b0,digit}==expected)
                right = right+1;
            $display("%0d. Accuracy: %f, Detected number: %0x, Expected: %x",testDataCount+1,right*100.0/(testDataCount+1),digit,expected);
            /*$display("Total execution time",,,,$time-start,,"ns");
            j=0;
            repeat(10)
            begin
                readAxi(20);
                $display("Output of Neuron %d: %0x",j,axiRdData);
                j=j+1;
            end*/
        end
        $display("Accuracy: %f",right*100.0/testDataCount);
        $stop;
    end


endmodule
