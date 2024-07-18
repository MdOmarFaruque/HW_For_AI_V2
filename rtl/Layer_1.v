module Layer_1 #(parameter NN = 30,numWeight=784,dataWidth=16,layerNum=1,sigmoidSize=10,weightIntWidth=4,actType="relu")
    (
    input       wire    clk,
    input       wire    rst,
    input       wire    weightValid,
    input       wire    biasValid,
    input wire [15:0]    weightValue,
    input wire [15:0]    biasValue,
    input wire [15:0]    config_layer_num,
    input wire [15:0]    config_neuron_num,
    input  wire         x_valid,
    input wire [dataWidth-1:0]    x_in,
    output wire [NN-1:0]     o_valid,
    output wire [NN*dataWidth-1:0]  x_out
    );

neuron #(.numWeight(numWeight),.layerNo(layerNum),.neuronNo(0),.dataWidth(dataWidth),.sigmoidSize(sigmoidSize),.weightIntWidth(weightIntWidth),.actType(actType),.weightNUM(0),.biasNUM(0)) n_0(
        .clk(clk),
        .rst(rst),
        .myinput(x_in),
        .weightValid(weightValid),
        .biasValid(biasValid),
        .weightValue(weightValue),
        .biasValue(biasValue),
        .config_layer_num(config_layer_num),
        .config_neuron_num(config_neuron_num),
        .myinputValid(x_valid),
        .out(x_out[0*dataWidth+:dataWidth]),
        .outvalid(o_valid[0])
        );

neuron #(.numWeight(numWeight),.layerNo(layerNum),.neuronNo(1),.dataWidth(dataWidth),.sigmoidSize(sigmoidSize),.weightIntWidth(weightIntWidth),.actType(actType),.weightNUM(1),.biasNUM(1)) n_1(
        .clk(clk),
        .rst(rst),
        .myinput(x_in),
        .weightValid(weightValid),
        .biasValid(biasValid),
        .weightValue(weightValue),
        .biasValue(biasValue),
        .config_layer_num(config_layer_num),
        .config_neuron_num(config_neuron_num),
        .myinputValid(x_valid),
        .out(x_out[1*dataWidth+:dataWidth]),
        .outvalid(o_valid[1])
        );

neuron #(.numWeight(numWeight),.layerNo(layerNum),.neuronNo(2),.dataWidth(dataWidth),.sigmoidSize(sigmoidSize),.weightIntWidth(weightIntWidth),.actType(actType),.weightNUM(2),.biasNUM(2)) n_2(
        .clk(clk),
        .rst(rst),
        .myinput(x_in),
        .weightValid(weightValid),
        .biasValid(biasValid),
        .weightValue(weightValue),
        .biasValue(biasValue),
        .config_layer_num(config_layer_num),
        .config_neuron_num(config_neuron_num),
        .myinputValid(x_valid),
        .out(x_out[2*dataWidth+:dataWidth]),
        .outvalid(o_valid[2])
        );

neuron #(.numWeight(numWeight),.layerNo(layerNum),.neuronNo(3),.dataWidth(dataWidth),.sigmoidSize(sigmoidSize),.weightIntWidth(weightIntWidth),.actType(actType),.weightNUM(3),.biasNUM(3)) n_3(
        .clk(clk),
        .rst(rst),
        .myinput(x_in),
        .weightValid(weightValid),
        .biasValid(biasValid),
        .weightValue(weightValue),
        .biasValue(biasValue),
        .config_layer_num(config_layer_num),
        .config_neuron_num(config_neuron_num),
        .myinputValid(x_valid),
        .out(x_out[3*dataWidth+:dataWidth]),
        .outvalid(o_valid[3])
        );

neuron #(.numWeight(numWeight),.layerNo(layerNum),.neuronNo(4),.dataWidth(dataWidth),.sigmoidSize(sigmoidSize),.weightIntWidth(weightIntWidth),.actType(actType),.weightNUM(4),.biasNUM(4)) n_4(
        .clk(clk),
        .rst(rst),
        .myinput(x_in),
        .weightValid(weightValid),
        .biasValid(biasValid),
        .weightValue(weightValue),
        .biasValue(biasValue),
        .config_layer_num(config_layer_num),
        .config_neuron_num(config_neuron_num),
        .myinputValid(x_valid),
        .out(x_out[4*dataWidth+:dataWidth]),
        .outvalid(o_valid[4])
        );

neuron #(.numWeight(numWeight),.layerNo(layerNum),.neuronNo(5),.dataWidth(dataWidth),.sigmoidSize(sigmoidSize),.weightIntWidth(weightIntWidth),.actType(actType),.weightNUM(5),.biasNUM(5)) n_5(
        .clk(clk),
        .rst(rst),
        .myinput(x_in),
        .weightValid(weightValid),
        .biasValid(biasValid),
        .weightValue(weightValue),
        .biasValue(biasValue),
        .config_layer_num(config_layer_num),
        .config_neuron_num(config_neuron_num),
        .myinputValid(x_valid),
        .out(x_out[5*dataWidth+:dataWidth]),
        .outvalid(o_valid[5])
        );

neuron #(.numWeight(numWeight),.layerNo(layerNum),.neuronNo(6),.dataWidth(dataWidth),.sigmoidSize(sigmoidSize),.weightIntWidth(weightIntWidth),.actType(actType),.weightNUM(6),.biasNUM(6)) n_6(
        .clk(clk),
        .rst(rst),
        .myinput(x_in),
        .weightValid(weightValid),
        .biasValid(biasValid),
        .weightValue(weightValue),
        .biasValue(biasValue),
        .config_layer_num(config_layer_num),
        .config_neuron_num(config_neuron_num),
        .myinputValid(x_valid),
        .out(x_out[6*dataWidth+:dataWidth]),
        .outvalid(o_valid[6])
        );

neuron #(.numWeight(numWeight),.layerNo(layerNum),.neuronNo(7),.dataWidth(dataWidth),.sigmoidSize(sigmoidSize),.weightIntWidth(weightIntWidth),.actType(actType),.weightNUM(7),.biasNUM(7)) n_7(
        .clk(clk),
        .rst(rst),
        .myinput(x_in),
        .weightValid(weightValid),
        .biasValid(biasValid),
        .weightValue(weightValue),
        .biasValue(biasValue),
        .config_layer_num(config_layer_num),
        .config_neuron_num(config_neuron_num),
        .myinputValid(x_valid),
        .out(x_out[7*dataWidth+:dataWidth]),
        .outvalid(o_valid[7])
        );

neuron #(.numWeight(numWeight),.layerNo(layerNum),.neuronNo(8),.dataWidth(dataWidth),.sigmoidSize(sigmoidSize),.weightIntWidth(weightIntWidth),.actType(actType),.weightNUM(8),.biasNUM(8)) n_8(
        .clk(clk),
        .rst(rst),
        .myinput(x_in),
        .weightValid(weightValid),
        .biasValid(biasValid),
        .weightValue(weightValue),
        .biasValue(biasValue),
        .config_layer_num(config_layer_num),
        .config_neuron_num(config_neuron_num),
        .myinputValid(x_valid),
        .out(x_out[8*dataWidth+:dataWidth]),
        .outvalid(o_valid[8])
        );

neuron #(.numWeight(numWeight),.layerNo(layerNum),.neuronNo(9),.dataWidth(dataWidth),.sigmoidSize(sigmoidSize),.weightIntWidth(weightIntWidth),.actType(actType),.weightNUM(9),.biasNUM(9)) n_9(
        .clk(clk),
        .rst(rst),
        .myinput(x_in),
        .weightValid(weightValid),
        .biasValid(biasValid),
        .weightValue(weightValue),
        .biasValue(biasValue),
        .config_layer_num(config_layer_num),
        .config_neuron_num(config_neuron_num),
        .myinputValid(x_valid),
        .out(x_out[9*dataWidth+:dataWidth]),
        .outvalid(o_valid[9])
        );

neuron #(.numWeight(numWeight),.layerNo(layerNum),.neuronNo(10),.dataWidth(dataWidth),.sigmoidSize(sigmoidSize),.weightIntWidth(weightIntWidth),.actType(actType),.weightNUM(10),.biasNUM(10)) n_10(
        .clk(clk),
        .rst(rst),
        .myinput(x_in),
        .weightValid(weightValid),
        .biasValid(biasValid),
        .weightValue(weightValue),
        .biasValue(biasValue),
        .config_layer_num(config_layer_num),
        .config_neuron_num(config_neuron_num),
        .myinputValid(x_valid),
        .out(x_out[10*dataWidth+:dataWidth]),
        .outvalid(o_valid[10])
        );

neuron #(.numWeight(numWeight),.layerNo(layerNum),.neuronNo(11),.dataWidth(dataWidth),.sigmoidSize(sigmoidSize),.weightIntWidth(weightIntWidth),.actType(actType),.weightNUM(11),.biasNUM(11)) n_11(
        .clk(clk),
        .rst(rst),
        .myinput(x_in),
        .weightValid(weightValid),
        .biasValid(biasValid),
        .weightValue(weightValue),
        .biasValue(biasValue),
        .config_layer_num(config_layer_num),
        .config_neuron_num(config_neuron_num),
        .myinputValid(x_valid),
        .out(x_out[11*dataWidth+:dataWidth]),
        .outvalid(o_valid[11])
        );

neuron #(.numWeight(numWeight),.layerNo(layerNum),.neuronNo(12),.dataWidth(dataWidth),.sigmoidSize(sigmoidSize),.weightIntWidth(weightIntWidth),.actType(actType),.weightNUM(12),.biasNUM(12)) n_12(
        .clk(clk),
        .rst(rst),
        .myinput(x_in),
        .weightValid(weightValid),
        .biasValid(biasValid),
        .weightValue(weightValue),
        .biasValue(biasValue),
        .config_layer_num(config_layer_num),
        .config_neuron_num(config_neuron_num),
        .myinputValid(x_valid),
        .out(x_out[12*dataWidth+:dataWidth]),
        .outvalid(o_valid[12])
        );

neuron #(.numWeight(numWeight),.layerNo(layerNum),.neuronNo(13),.dataWidth(dataWidth),.sigmoidSize(sigmoidSize),.weightIntWidth(weightIntWidth),.actType(actType),.weightNUM(13),.biasNUM(13)) n_13(
        .clk(clk),
        .rst(rst),
        .myinput(x_in),
        .weightValid(weightValid),
        .biasValid(biasValid),
        .weightValue(weightValue),
        .biasValue(biasValue),
        .config_layer_num(config_layer_num),
        .config_neuron_num(config_neuron_num),
        .myinputValid(x_valid),
        .out(x_out[13*dataWidth+:dataWidth]),
        .outvalid(o_valid[13])
        );

neuron #(.numWeight(numWeight),.layerNo(layerNum),.neuronNo(14),.dataWidth(dataWidth),.sigmoidSize(sigmoidSize),.weightIntWidth(weightIntWidth),.actType(actType),.weightNUM(14),.biasNUM(14)) n_14(
        .clk(clk),
        .rst(rst),
        .myinput(x_in),
        .weightValid(weightValid),
        .biasValid(biasValid),
        .weightValue(weightValue),
        .biasValue(biasValue),
        .config_layer_num(config_layer_num),
        .config_neuron_num(config_neuron_num),
        .myinputValid(x_valid),
        .out(x_out[14*dataWidth+:dataWidth]),
        .outvalid(o_valid[14])
        );

neuron #(.numWeight(numWeight),.layerNo(layerNum),.neuronNo(15),.dataWidth(dataWidth),.sigmoidSize(sigmoidSize),.weightIntWidth(weightIntWidth),.actType(actType),.weightNUM(15),.biasNUM(15)) n_15(
        .clk(clk),
        .rst(rst),
        .myinput(x_in),
        .weightValid(weightValid),
        .biasValid(biasValid),
        .weightValue(weightValue),
        .biasValue(biasValue),
        .config_layer_num(config_layer_num),
        .config_neuron_num(config_neuron_num),
        .myinputValid(x_valid),
        .out(x_out[15*dataWidth+:dataWidth]),
        .outvalid(o_valid[15])
        );

neuron #(.numWeight(numWeight),.layerNo(layerNum),.neuronNo(16),.dataWidth(dataWidth),.sigmoidSize(sigmoidSize),.weightIntWidth(weightIntWidth),.actType(actType),.weightNUM(16),.biasNUM(16)) n_16(
        .clk(clk),
        .rst(rst),
        .myinput(x_in),
        .weightValid(weightValid),
        .biasValid(biasValid),
        .weightValue(weightValue),
        .biasValue(biasValue),
        .config_layer_num(config_layer_num),
        .config_neuron_num(config_neuron_num),
        .myinputValid(x_valid),
        .out(x_out[16*dataWidth+:dataWidth]),
        .outvalid(o_valid[16])
        );

neuron #(.numWeight(numWeight),.layerNo(layerNum),.neuronNo(17),.dataWidth(dataWidth),.sigmoidSize(sigmoidSize),.weightIntWidth(weightIntWidth),.actType(actType),.weightNUM(17),.biasNUM(17)) n_17(
        .clk(clk),
        .rst(rst),
        .myinput(x_in),
        .weightValid(weightValid),
        .biasValid(biasValid),
        .weightValue(weightValue),
        .biasValue(biasValue),
        .config_layer_num(config_layer_num),
        .config_neuron_num(config_neuron_num),
        .myinputValid(x_valid),
        .out(x_out[17*dataWidth+:dataWidth]),
        .outvalid(o_valid[17])
        );

neuron #(.numWeight(numWeight),.layerNo(layerNum),.neuronNo(18),.dataWidth(dataWidth),.sigmoidSize(sigmoidSize),.weightIntWidth(weightIntWidth),.actType(actType),.weightNUM(18),.biasNUM(18)) n_18(
        .clk(clk),
        .rst(rst),
        .myinput(x_in),
        .weightValid(weightValid),
        .biasValid(biasValid),
        .weightValue(weightValue),
        .biasValue(biasValue),
        .config_layer_num(config_layer_num),
        .config_neuron_num(config_neuron_num),
        .myinputValid(x_valid),
        .out(x_out[18*dataWidth+:dataWidth]),
        .outvalid(o_valid[18])
        );

neuron #(.numWeight(numWeight),.layerNo(layerNum),.neuronNo(19),.dataWidth(dataWidth),.sigmoidSize(sigmoidSize),.weightIntWidth(weightIntWidth),.actType(actType),.weightNUM(19),.biasNUM(19)) n_19(
        .clk(clk),
        .rst(rst),
        .myinput(x_in),
        .weightValid(weightValid),
        .biasValid(biasValid),
        .weightValue(weightValue),
        .biasValue(biasValue),
        .config_layer_num(config_layer_num),
        .config_neuron_num(config_neuron_num),
        .myinputValid(x_valid),
        .out(x_out[19*dataWidth+:dataWidth]),
        .outvalid(o_valid[19])
        );

neuron #(.numWeight(numWeight),.layerNo(layerNum),.neuronNo(20),.dataWidth(dataWidth),.sigmoidSize(sigmoidSize),.weightIntWidth(weightIntWidth),.actType(actType),.weightNUM(20),.biasNUM(20)) n_20(
        .clk(clk),
        .rst(rst),
        .myinput(x_in),
        .weightValid(weightValid),
        .biasValid(biasValid),
        .weightValue(weightValue),
        .biasValue(biasValue),
        .config_layer_num(config_layer_num),
        .config_neuron_num(config_neuron_num),
        .myinputValid(x_valid),
        .out(x_out[20*dataWidth+:dataWidth]),
        .outvalid(o_valid[20])
        );

neuron #(.numWeight(numWeight),.layerNo(layerNum),.neuronNo(21),.dataWidth(dataWidth),.sigmoidSize(sigmoidSize),.weightIntWidth(weightIntWidth),.actType(actType),.weightNUM(21),.biasNUM(21)) n_21(
        .clk(clk),
        .rst(rst),
        .myinput(x_in),
        .weightValid(weightValid),
        .biasValid(biasValid),
        .weightValue(weightValue),
        .biasValue(biasValue),
        .config_layer_num(config_layer_num),
        .config_neuron_num(config_neuron_num),
        .myinputValid(x_valid),
        .out(x_out[21*dataWidth+:dataWidth]),
        .outvalid(o_valid[21])
        );

neuron #(.numWeight(numWeight),.layerNo(layerNum),.neuronNo(22),.dataWidth(dataWidth),.sigmoidSize(sigmoidSize),.weightIntWidth(weightIntWidth),.actType(actType),.weightNUM(22),.biasNUM(22)) n_22(
        .clk(clk),
        .rst(rst),
        .myinput(x_in),
        .weightValid(weightValid),
        .biasValid(biasValid),
        .weightValue(weightValue),
        .biasValue(biasValue),
        .config_layer_num(config_layer_num),
        .config_neuron_num(config_neuron_num),
        .myinputValid(x_valid),
        .out(x_out[22*dataWidth+:dataWidth]),
        .outvalid(o_valid[22])
        );

neuron #(.numWeight(numWeight),.layerNo(layerNum),.neuronNo(23),.dataWidth(dataWidth),.sigmoidSize(sigmoidSize),.weightIntWidth(weightIntWidth),.actType(actType),.weightNUM(23),.biasNUM(23)) n_23(
        .clk(clk),
        .rst(rst),
        .myinput(x_in),
        .weightValid(weightValid),
        .biasValid(biasValid),
        .weightValue(weightValue),
        .biasValue(biasValue),
        .config_layer_num(config_layer_num),
        .config_neuron_num(config_neuron_num),
        .myinputValid(x_valid),
        .out(x_out[23*dataWidth+:dataWidth]),
        .outvalid(o_valid[23])
        );

neuron #(.numWeight(numWeight),.layerNo(layerNum),.neuronNo(24),.dataWidth(dataWidth),.sigmoidSize(sigmoidSize),.weightIntWidth(weightIntWidth),.actType(actType),.weightNUM(24),.biasNUM(24)) n_24(
        .clk(clk),
        .rst(rst),
        .myinput(x_in),
        .weightValid(weightValid),
        .biasValid(biasValid),
        .weightValue(weightValue),
        .biasValue(biasValue),
        .config_layer_num(config_layer_num),
        .config_neuron_num(config_neuron_num),
        .myinputValid(x_valid),
        .out(x_out[24*dataWidth+:dataWidth]),
        .outvalid(o_valid[24])
        );

neuron #(.numWeight(numWeight),.layerNo(layerNum),.neuronNo(25),.dataWidth(dataWidth),.sigmoidSize(sigmoidSize),.weightIntWidth(weightIntWidth),.actType(actType),.weightNUM(25),.biasNUM(25)) n_25(
        .clk(clk),
        .rst(rst),
        .myinput(x_in),
        .weightValid(weightValid),
        .biasValid(biasValid),
        .weightValue(weightValue),
        .biasValue(biasValue),
        .config_layer_num(config_layer_num),
        .config_neuron_num(config_neuron_num),
        .myinputValid(x_valid),
        .out(x_out[25*dataWidth+:dataWidth]),
        .outvalid(o_valid[25])
        );

neuron #(.numWeight(numWeight),.layerNo(layerNum),.neuronNo(26),.dataWidth(dataWidth),.sigmoidSize(sigmoidSize),.weightIntWidth(weightIntWidth),.actType(actType),.weightNUM(26),.biasNUM(26)) n_26(
        .clk(clk),
        .rst(rst),
        .myinput(x_in),
        .weightValid(weightValid),
        .biasValid(biasValid),
        .weightValue(weightValue),
        .biasValue(biasValue),
        .config_layer_num(config_layer_num),
        .config_neuron_num(config_neuron_num),
        .myinputValid(x_valid),
        .out(x_out[26*dataWidth+:dataWidth]),
        .outvalid(o_valid[26])
        );

neuron #(.numWeight(numWeight),.layerNo(layerNum),.neuronNo(27),.dataWidth(dataWidth),.sigmoidSize(sigmoidSize),.weightIntWidth(weightIntWidth),.actType(actType),.weightNUM(27),.biasNUM(27)) n_27(
        .clk(clk),
        .rst(rst),
        .myinput(x_in),
        .weightValid(weightValid),
        .biasValid(biasValid),
        .weightValue(weightValue),
        .biasValue(biasValue),
        .config_layer_num(config_layer_num),
        .config_neuron_num(config_neuron_num),
        .myinputValid(x_valid),
        .out(x_out[27*dataWidth+:dataWidth]),
        .outvalid(o_valid[27])
        );

neuron #(.numWeight(numWeight),.layerNo(layerNum),.neuronNo(28),.dataWidth(dataWidth),.sigmoidSize(sigmoidSize),.weightIntWidth(weightIntWidth),.actType(actType),.weightNUM(28),.biasNUM(28)) n_28(
        .clk(clk),
        .rst(rst),
        .myinput(x_in),
        .weightValid(weightValid),
        .biasValid(biasValid),
        .weightValue(weightValue),
        .biasValue(biasValue),
        .config_layer_num(config_layer_num),
        .config_neuron_num(config_neuron_num),
        .myinputValid(x_valid),
        .out(x_out[28*dataWidth+:dataWidth]),
        .outvalid(o_valid[28])
        );

neuron #(.numWeight(numWeight),.layerNo(layerNum),.neuronNo(29),.dataWidth(dataWidth),.sigmoidSize(sigmoidSize),.weightIntWidth(weightIntWidth),.actType(actType),.weightNUM(29),.biasNUM(29)) n_29(
        .clk(clk),
        .rst(rst),
        .myinput(x_in),
        .weightValid(weightValid),
        .biasValid(biasValid),
        .weightValue(weightValue),
        .biasValue(biasValue),
        .config_layer_num(config_layer_num),
        .config_neuron_num(config_neuron_num),
        .myinputValid(x_valid),
        .out(x_out[29*dataWidth+:dataWidth]),
        .outvalid(o_valid[29])
        );

endmodule
