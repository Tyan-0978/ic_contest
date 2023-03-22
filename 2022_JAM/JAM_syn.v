/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : R-2020.09-SP5
// Date      : Thu Mar 23 03:47:59 2023
/////////////////////////////////////////////////////////////


module JAM_DW01_add_0 ( A, B, CI, SUM, CO );
  input [9:0] A;
  input [9:0] B;
  output [9:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3;
  wire   [9:1] carry;

  ADDFXL U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFXL U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFXL U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFXL U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFXL U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFXL U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  AND2X2 U2 ( .A(A[8]), .B(n3), .Y(n2) );
  XOR2X1 U3 ( .A(A[9]), .B(n2), .Y(SUM[9]) );
  AND2X2 U4 ( .A(A[7]), .B(carry[7]), .Y(n3) );
  XOR2X1 U5 ( .A(A[8]), .B(n3), .Y(SUM[8]) );
  XOR2X1 U6 ( .A(A[7]), .B(carry[7]), .Y(SUM[7]) );
  XOR2X1 U7 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module JAM ( CLK, RST, MatchCount, MinCost, Valid, W, J, Cost );
  output [3:0] MatchCount;
  output [9:0] MinCost;
  output [2:0] W;
  output [2:0] J;
  input [6:0] Cost;
  input CLK, RST;
  output Valid;
  wire   n500, n501, n502, n503, n504, n505, n506, n507, n508, n509, n510,
         n511, n512, n513, n514, n515, \perm[6][2] , \perm[6][1] ,
         \perm[6][0] , \perm[7][2] , \perm_ext[0][2] , \perm_ext[0][1] ,
         \perm_ext[0][0] , next_finished, \perm_turn[0][2] , \perm_turn[0][1] ,
         \perm_turn[0][0] , N292, N293, N294, N295, N296, N297, N298, N299,
         N300, N301, N303, N304, n17, n22, n23, n24, n29, n30, n41, n42, n46,
         n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60,
         n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74,
         n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88,
         n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101,
         n102, n103, n104, n105, n106, n107, n108, n109, n110, n111, n112,
         n113, n114, n115, n116, n117, n118, n119, n120, n121, n122, n123,
         n124, n125, n126, n127, n128, n129, n130, n131, n132, n133, n134,
         n135, n136, n137, n138, n139, n140, n141, n142, n143, n144, n145,
         n146, n147, n148, n149, n150, n151, n152, n153, n154, n155, n156,
         n157, n158, n159, n160, n161, n162, n163, n164, n165, n166, n167,
         n168, n169, n170, n171, n172, n173, n174, n175, n176, n177, n178,
         n179, n180, n181, n182, n183, n184, n185, n186, n187, n188, n189,
         n190, n191, n192, n193, n194, n195, n196, n197, n198, n199, n200,
         n201, n202, n203, n204, n205, n206, n207, n208, n209, n210, n211,
         n212, n213, n214, n215, n216, n217, n218, n219, n220, n221, n222,
         n223, n224, n225, n226, n227, n228, n229, n230, n231, n232, n233,
         n234, n235, n236, n237, n238, n239, n240, n241, n242, n243, n244,
         n245, n246, n247, n248, n249, n250, n251, n252, n253, n254, n255,
         n256, n257, n258, n259, n260, n261, n262, n263, n264, n265, n266,
         n267, n268, n269, n270, n271, n272, n273, n274, n275, n276, n277,
         n278, n279, n280, n281, n282, n283, n284, n285, n286, n287, n288,
         n289, n290, n291, n292, n293, n294, n295, n296, n297, n298, n299,
         n300, n301, n302, n303, n304, n305, n306, n307, n308, n309, n310,
         n311, n312, n313, n314, n315, n316, n317, n318, n319, n320, n321,
         n322, n323, n324, n325, n326, n327, n328, n329, n330, n331, n332,
         n333, n334, n335, n336, n337, n338, n339, n340, n341, n342, n343,
         n344, n345, n346, n347, n348, n349, n350, n351, n352, n353, n354,
         n355, n356, n357, n358, n359, n360, n361, n362, n363, n364, n365,
         n366, n367, n368, n369, n370, n371, n372, n373, n374, n375, n376,
         n377, n378, n379, n380, n381, n382, n383, n384, n385, n386, n387,
         n388, n389, n390, n394, n396, n406, n408, n410, n412, n414, n416,
         n418, n420, n422, n423, n424, n425, n426, n427, n428, n429, n430,
         n431, n432, n433, n434, n435, n436, n437, n438, n439, n440, n441,
         n442, n443, n444, n445, n446, n447, n448, n449, n450, n451, n452,
         n453, n454, n455, n456, n457, n458, n459, n460, n461, n462, n463,
         n464, n465, n466, n467, n468, n469, n470, n471, n472, n473, n474,
         n475, n476, n477, n478, n479, n480, n481, n482, n483, n484, n485,
         n486, n487, n488, n489, n490, n491, n492, n493, n494, n495, n496,
         n497, n498, n499;
  wire   [2:0] perm_state;
  wire   [2:0] turn_count;
  wire   [1:0] adder_state;
  wire   [2:0] shift_count;
  wire   [2:0] next_perm_state;
  wire   [3:0] adder_count;
  wire   [1:0] next_adder_state;
  wire   [3:0] next_adder_count;
  wire   [9:0] psum;

  JAM_DW01_add_0 add_423 ( .A(psum), .B({1'b0, 1'b0, 1'b0, Cost}), .CI(1'b0), 
        .SUM({N301, N300, N299, N298, N297, N296, N295, N294, N293, N292}) );
  DFFRX1 \jobs_reg[3][2]  ( .D(n262), .CK(CLK), .RN(n440), .QN(n156) );
  DFFRX1 \jobs_reg[2][2]  ( .D(n259), .CK(CLK), .RN(n440), .QN(n153) );
  DFFRX1 \jobs_reg[1][2]  ( .D(n256), .CK(CLK), .RN(n440), .QN(n150) );
  DFFRX1 \jobs_reg[5][1]  ( .D(n269), .CK(CLK), .RN(n441), .QN(n163) );
  DFFRX1 \jobs_reg[1][1]  ( .D(n257), .CK(CLK), .RN(n441), .QN(n151) );
  DFFSX1 \jobs_reg[4][2]  ( .D(n265), .CK(CLK), .SN(n441), .QN(n159) );
  DFFSX1 \jobs_reg[6][1]  ( .D(n272), .CK(CLK), .SN(n441), .QN(n166) );
  DFFSX1 \jobs_reg[2][1]  ( .D(n260), .CK(CLK), .SN(n442), .QN(n154) );
  DFFSX1 \jobs_reg[7][0]  ( .D(n276), .CK(CLK), .SN(n442), .QN(n170) );
  DFFSX1 \jobs_reg[5][0]  ( .D(n270), .CK(CLK), .SN(n442), .QN(n164) );
  DFFSX1 \jobs_reg[3][0]  ( .D(n264), .CK(CLK), .SN(n442), .QN(n158) );
  DFFSX1 \jobs_reg[1][0]  ( .D(n258), .CK(CLK), .SN(n442), .QN(n152) );
  DFFSX1 \jobs_reg[7][2]  ( .D(n274), .CK(CLK), .SN(n442), .QN(n168) );
  DFFSX1 \jobs_reg[6][2]  ( .D(n271), .CK(CLK), .SN(n441), .QN(n165) );
  DFFSX1 \jobs_reg[5][2]  ( .D(n268), .CK(CLK), .SN(n442), .QN(n162) );
  DFFSX1 \jobs_reg[7][1]  ( .D(n275), .CK(CLK), .SN(n442), .QN(n169) );
  DFFSX1 \jobs_reg[3][1]  ( .D(n263), .CK(CLK), .SN(n441), .QN(n157) );
  DFFRX1 \jobs_reg[4][1]  ( .D(n266), .CK(CLK), .RN(n440), .QN(n160) );
  DFFRX1 \jobs_reg[6][0]  ( .D(n273), .CK(CLK), .RN(n440), .QN(n167) );
  DFFRX1 \jobs_reg[4][0]  ( .D(n267), .CK(CLK), .RN(n441), .QN(n161) );
  DFFRX1 \jobs_reg[2][0]  ( .D(n261), .CK(CLK), .RN(n441), .QN(n155) );
  DFFRX1 \workers_reg[7][2]  ( .D(n302), .CK(CLK), .RN(n435), .QN(n70) );
  DFFRX1 \workers_reg[6][2]  ( .D(n299), .CK(CLK), .RN(n435), .QN(n67) );
  DFFRX1 \workers_reg[5][2]  ( .D(n296), .CK(CLK), .RN(n436), .QN(n64) );
  DFFRX1 \workers_reg[4][2]  ( .D(n293), .CK(CLK), .RN(n436), .QN(n61) );
  DFFRX1 \workers_reg[3][2]  ( .D(n290), .CK(CLK), .RN(n436), .QN(n58) );
  DFFRX1 \workers_reg[2][2]  ( .D(n287), .CK(CLK), .RN(n437), .QN(n55) );
  DFFRX1 \workers_reg[1][2]  ( .D(n284), .CK(CLK), .RN(n436), .QN(n52) );
  DFFRX1 \workers_reg[7][1]  ( .D(n303), .CK(CLK), .RN(n438), .QN(n71) );
  DFFRX1 \workers_reg[6][1]  ( .D(n300), .CK(CLK), .RN(n438), .QN(n68) );
  DFFRX1 \workers_reg[5][1]  ( .D(n297), .CK(CLK), .RN(n438), .QN(n65) );
  DFFRX1 \workers_reg[4][1]  ( .D(n294), .CK(CLK), .RN(n438), .QN(n62) );
  DFFRX1 \workers_reg[3][1]  ( .D(n291), .CK(CLK), .RN(n438), .QN(n59) );
  DFFRX1 \workers_reg[2][1]  ( .D(n288), .CK(CLK), .RN(n438), .QN(n56) );
  DFFRX1 \workers_reg[1][1]  ( .D(n285), .CK(CLK), .RN(n438), .QN(n53) );
  DFFRX1 \workers_reg[7][0]  ( .D(n304), .CK(CLK), .RN(n438), .QN(n72) );
  DFFRX1 \workers_reg[6][0]  ( .D(n301), .CK(CLK), .RN(n439), .QN(n69) );
  DFFRX1 \workers_reg[5][0]  ( .D(n298), .CK(CLK), .RN(n439), .QN(n66) );
  DFFRX1 \workers_reg[4][0]  ( .D(n295), .CK(CLK), .RN(n439), .QN(n63) );
  DFFRX1 \workers_reg[3][0]  ( .D(n292), .CK(CLK), .RN(n439), .QN(n60) );
  DFFRX1 \workers_reg[2][0]  ( .D(n289), .CK(CLK), .RN(n439), .QN(n57) );
  DFFRX1 \workers_reg[1][0]  ( .D(n286), .CK(CLK), .RN(n439), .QN(n54) );
  DFFRX1 \perm_reg[0][0]  ( .D(n307), .CK(CLK), .RN(n438), .QN(n86) );
  DFFRX1 \perm_reg[5][1]  ( .D(n385), .CK(CLK), .RN(n437), .QN(n100) );
  DFFSX1 \perm_reg[5][2]  ( .D(n388), .CK(CLK), .SN(n443), .QN(n99) );
  DFFSX1 \perm_reg[5][0]  ( .D(n386), .CK(CLK), .SN(n441), .QN(n101) );
  DFFRX1 \perm_turn_reg[5][0]  ( .D(n390), .CK(CLK), .RN(n436), .QN(n143) );
  DFFRX1 \perm_ext_reg[5][1]  ( .D(n351), .CK(CLK), .RN(n435), .QN(n124) );
  DFFRX1 \perm_ext_reg[5][0]  ( .D(n350), .CK(CLK), .RN(n435), .QN(n125) );
  DFFRX1 \perm_ext_reg[5][2]  ( .D(n352), .CK(CLK), .RN(n436), .QN(n123) );
  DFFRX1 \perm_turn_reg[5][2]  ( .D(n368), .CK(CLK), .RN(n437), .QN(n141) );
  DFFRX1 \perm_turn_reg[5][1]  ( .D(n367), .CK(CLK), .RN(n439), .QN(n142) );
  DFFRX1 \perm_reg[3][2]  ( .D(n314), .CK(CLK), .RN(n434), .QN(n93) );
  DFFRX1 \perm_reg[4][0]  ( .D(n319), .CK(CLK), .RN(n438), .QN(n98) );
  DFFRX1 \perm_reg[2][0]  ( .D(n313), .CK(CLK), .RN(n438), .QN(n92) );
  DFFSX1 \perm_reg[4][2]  ( .D(n317), .CK(CLK), .SN(n442), .QN(n96) );
  DFFSX1 \perm_reg[2][1]  ( .D(n312), .CK(CLK), .SN(n441), .QN(n91) );
  DFFRX1 \perm_reg[0][2]  ( .D(n305), .CK(CLK), .RN(n434), .QN(n84) );
  DFFRX1 \perm_reg[0][1]  ( .D(n306), .CK(CLK), .RN(n437), .QN(n85) );
  DFFRX1 \perm_turn_reg[3][0]  ( .D(n372), .CK(CLK), .RN(n432), .QN(n137) );
  DFFRX1 \perm_turn_reg[2][0]  ( .D(n375), .CK(CLK), .RN(n432), .QN(n134) );
  DFFRX1 \perm_turn_reg[1][0]  ( .D(n378), .CK(CLK), .RN(n432), .QN(n131) );
  DFFRX1 \perm_ext_reg[1][1]  ( .D(n363), .CK(CLK), .RN(n434), .QN(n112) );
  DFFRX1 \perm_ext_reg[2][1]  ( .D(n360), .CK(CLK), .RN(n435), .QN(n115) );
  DFFRX1 \perm_ext_reg[3][1]  ( .D(n357), .CK(CLK), .RN(n435), .QN(n118) );
  DFFRX1 \perm_ext_reg[1][0]  ( .D(n362), .CK(CLK), .RN(n435), .QN(n113) );
  DFFRX1 \perm_ext_reg[2][0]  ( .D(n359), .CK(CLK), .RN(n435), .QN(n116) );
  DFFRX1 \perm_ext_reg[3][0]  ( .D(n356), .CK(CLK), .RN(n435), .QN(n119) );
  DFFRX1 \perm_ext_reg[1][2]  ( .D(n364), .CK(CLK), .RN(n436), .QN(n111) );
  DFFRX1 \perm_ext_reg[2][2]  ( .D(n361), .CK(CLK), .RN(n436), .QN(n114) );
  DFFRX1 \perm_ext_reg[3][2]  ( .D(n358), .CK(CLK), .RN(n436), .QN(n117) );
  DFFRX1 \perm_turn_reg[1][2]  ( .D(n380), .CK(CLK), .RN(n437), .QN(n129) );
  DFFRX1 \perm_turn_reg[2][2]  ( .D(n377), .CK(CLK), .RN(n437), .QN(n132) );
  DFFRX1 \perm_turn_reg[3][2]  ( .D(n374), .CK(CLK), .RN(n437), .QN(n135) );
  DFFRX1 \perm_turn_reg[1][1]  ( .D(n379), .CK(CLK), .RN(n439), .QN(n130) );
  DFFRX1 \perm_turn_reg[2][1]  ( .D(n376), .CK(CLK), .RN(n439), .QN(n133) );
  DFFRX1 \perm_turn_reg[3][1]  ( .D(n373), .CK(CLK), .RN(n439), .QN(n136) );
  DFFRX1 \perm_reg[1][1]  ( .D(n309), .CK(CLK), .RN(n437), .QN(n88) );
  DFFRX1 \perm_turn_reg[4][0]  ( .D(n369), .CK(CLK), .RN(n432), .QN(n140) );
  DFFRX1 \perm_ext_reg[4][1]  ( .D(n354), .CK(CLK), .RN(n435), .QN(n121) );
  DFFRX1 \perm_ext_reg[4][0]  ( .D(n353), .CK(CLK), .RN(n435), .QN(n122) );
  DFFRX1 \perm_ext_reg[4][2]  ( .D(n355), .CK(CLK), .RN(n436), .QN(n120) );
  DFFRX1 \perm_turn_reg[4][2]  ( .D(n371), .CK(CLK), .RN(n437), .QN(n138) );
  DFFRX1 \perm_turn_reg[4][1]  ( .D(n370), .CK(CLK), .RN(n440), .QN(n139) );
  DFFRX1 \perm_reg[2][2]  ( .D(n311), .CK(CLK), .RN(n434), .QN(n90) );
  DFFRX1 \perm_reg[4][1]  ( .D(n318), .CK(CLK), .RN(n437), .QN(n97) );
  DFFSX1 \perm_reg[3][1]  ( .D(n315), .CK(CLK), .SN(n441), .QN(n94) );
  DFFSX1 \perm_reg[3][0]  ( .D(n316), .CK(CLK), .SN(n441), .QN(n95) );
  DFFRX1 \perm_reg[1][2]  ( .D(n308), .CK(CLK), .RN(n434), .QN(n87) );
  DFFSX1 \perm_reg[1][0]  ( .D(n310), .CK(CLK), .SN(n441), .QN(n89) );
  DFFRX1 \perm_turn_reg[0][2]  ( .D(n389), .CK(CLK), .RN(n437), .Q(
        \perm_turn[0][2] ), .QN(n126) );
  DFFRX1 \perm_turn_reg[0][0]  ( .D(n381), .CK(CLK), .RN(n432), .Q(
        \perm_turn[0][0] ), .QN(n128) );
  DFFRX1 \perm_turn_reg[0][1]  ( .D(n382), .CK(CLK), .RN(n439), .Q(
        \perm_turn[0][1] ), .QN(n127) );
  DFFRX1 \adder_count_reg[3]  ( .D(next_adder_count[3]), .CK(CLK), .RN(n433), 
        .Q(adder_count[3]), .QN(n46) );
  DFFRX1 \turn_count_reg[2]  ( .D(n384), .CK(CLK), .RN(n434), .Q(turn_count[2]), .QN(n24) );
  DFFRX1 \adder_count_reg[2]  ( .D(next_adder_count[2]), .CK(CLK), .RN(n433), 
        .Q(adder_count[2]), .QN(n47) );
  DFFRX1 \adder_count_reg[1]  ( .D(next_adder_count[1]), .CK(CLK), .RN(n433), 
        .Q(adder_count[1]), .QN(n48) );
  DFFRX1 \shift_count_reg[2]  ( .D(n340), .CK(CLK), .RN(n432), .Q(
        shift_count[2]), .QN(n17) );
  DFFRX1 \turn_count_reg[1]  ( .D(n349), .CK(CLK), .RN(n434), .Q(turn_count[1]), .QN(n29) );
  DFFRX1 \shift_count_reg[1]  ( .D(n341), .CK(CLK), .RN(n432), .Q(
        shift_count[1]), .QN(n22) );
  DFFRX1 \adder_state_reg[1]  ( .D(next_adder_state[1]), .CK(CLK), .RN(n433), 
        .Q(adder_state[1]) );
  DFFRX1 \adder_state_reg[0]  ( .D(next_adder_state[0]), .CK(CLK), .RN(n433), 
        .Q(adder_state[0]) );
  DFFRX1 \perm_ext_reg[0][0]  ( .D(n365), .CK(CLK), .RN(n435), .Q(
        \perm_ext[0][0] ), .QN(n110) );
  DFFRX1 \perm_ext_reg[0][1]  ( .D(n366), .CK(CLK), .RN(n432), .Q(
        \perm_ext[0][1] ), .QN(n109) );
  DFFRX1 \perm_ext_reg[0][2]  ( .D(n383), .CK(CLK), .RN(n436), .Q(
        \perm_ext[0][2] ), .QN(n108) );
  DFFRX1 \perm_state_reg[1]  ( .D(next_perm_state[1]), .CK(CLK), .RN(n432), 
        .Q(perm_state[1]), .QN(n41) );
  DFFSX1 \perm_reg[7][2]  ( .D(n343), .CK(CLK), .SN(n442), .Q(\perm[7][2] ), 
        .QN(n105) );
  DFFRX1 \perm_state_reg[0]  ( .D(next_perm_state[0]), .CK(CLK), .RN(n432), 
        .Q(perm_state[0]), .QN(n42) );
  DFFRX1 \perm_reg[6][0]  ( .D(n347), .CK(CLK), .RN(n438), .Q(\perm[6][0] ), 
        .QN(n104) );
  DFFRX1 \psum_reg[9]  ( .D(n330), .CK(CLK), .RN(n434), .Q(psum[9]), .QN(n73)
         );
  DFFRX1 \psum_reg[8]  ( .D(n339), .CK(CLK), .RN(n433), .Q(psum[8]), .QN(n74)
         );
  DFFRX1 \psum_reg[7]  ( .D(n331), .CK(CLK), .RN(n434), .Q(psum[7]), .QN(n75)
         );
  DFFRX1 \psum_reg[6]  ( .D(n332), .CK(CLK), .RN(n434), .Q(psum[6]), .QN(n76)
         );
  DFFRX1 \psum_reg[5]  ( .D(n333), .CK(CLK), .RN(n434), .Q(psum[5]), .QN(n77)
         );
  DFFRX1 \psum_reg[4]  ( .D(n334), .CK(CLK), .RN(n433), .Q(psum[4]), .QN(n78)
         );
  DFFRX1 \psum_reg[3]  ( .D(n335), .CK(CLK), .RN(n433), .Q(psum[3]), .QN(n79)
         );
  DFFRX1 \psum_reg[2]  ( .D(n336), .CK(CLK), .RN(n433), .Q(psum[2]), .QN(n80)
         );
  DFFRX1 \psum_reg[1]  ( .D(n337), .CK(CLK), .RN(n433), .Q(psum[1]), .QN(n81)
         );
  DFFRX1 \psum_reg[0]  ( .D(n338), .CK(CLK), .RN(n433), .Q(psum[0]), .QN(n82)
         );
  DFFRX1 \adder_count_reg[0]  ( .D(next_adder_count[0]), .CK(CLK), .RN(n433), 
        .Q(adder_count[0]) );
  DFFRX1 \turn_count_reg[0]  ( .D(n348), .CK(CLK), .RN(n434), .Q(turn_count[0]), .QN(n30) );
  DFFSX1 \perm_reg[6][1]  ( .D(n346), .CK(CLK), .SN(n442), .Q(\perm[6][1] ), 
        .QN(n103) );
  DFFSX1 \perm_state_reg[2]  ( .D(next_perm_state[2]), .CK(CLK), .SN(n443), 
        .Q(perm_state[2]) );
  DFFSX1 \min_cost_reg[8]  ( .D(n328), .CK(CLK), .SN(n443), .Q(n502), .QN(n420) );
  DFFSX1 \min_cost_reg[4]  ( .D(n324), .CK(CLK), .SN(n443), .Q(n505), .QN(n418) );
  DFFSX1 \min_cost_reg[3]  ( .D(n323), .CK(CLK), .SN(n443), .Q(n506), .QN(n416) );
  DFFSX1 \min_cost_reg[0]  ( .D(n320), .CK(CLK), .SN(n443), .Q(n508), .QN(n414) );
  DFFSX1 \min_cost_reg[9]  ( .D(n329), .CK(CLK), .SN(n442), .Q(n501), .QN(n412) );
  DFFSX1 \min_cost_reg[7]  ( .D(n327), .CK(CLK), .SN(n443), .Q(n503), .QN(n410) );
  DFFSX1 \min_cost_reg[2]  ( .D(n322), .CK(CLK), .SN(n443), .QN(n408) );
  DFFSX1 \min_cost_reg[6]  ( .D(n326), .CK(CLK), .SN(n443), .QN(n406) );
  DFFRX1 \workers_reg[0][0]  ( .D(n283), .CK(CLK), .RN(n439), .Q(n512), .QN(
        n51) );
  DFFRX1 \workers_reg[0][1]  ( .D(n282), .CK(CLK), .RN(n437), .Q(n511), .QN(
        n50) );
  DFFRX1 \workers_reg[0][2]  ( .D(n281), .CK(CLK), .RN(n436), .Q(n510), .QN(
        n49) );
  DFFRX1 \jobs_reg[0][0]  ( .D(n255), .CK(CLK), .RN(n440), .Q(n515), .QN(n149)
         );
  DFFRX1 \jobs_reg[0][1]  ( .D(n254), .CK(CLK), .RN(n440), .Q(n514), .QN(n148)
         );
  DFFRX1 \jobs_reg[0][2]  ( .D(n253), .CK(CLK), .RN(n440), .Q(n513), .QN(n147)
         );
  DFFRX1 finished_reg ( .D(next_finished), .CK(CLK), .RN(n432), .Q(n509), .QN(
        n83) );
  DFFSX1 \min_cost_reg[1]  ( .D(n321), .CK(CLK), .SN(n443), .Q(n507), .QN(n476) );
  DFFSX1 \min_cost_reg[5]  ( .D(n325), .CK(CLK), .SN(n443), .Q(n504), .QN(n396) );
  DFFRX1 \min_count_reg[3]  ( .D(n277), .CK(CLK), .RN(n440), .Q(n500), .QN(
        n394) );
  DFFRX1 \shift_count_reg[0]  ( .D(n342), .CK(CLK), .RN(n479), .Q(
        shift_count[0]), .QN(n23) );
  DFFRX1 \min_count_reg[2]  ( .D(n278), .CK(CLK), .RN(n440), .QN(n144) );
  DFFRX1 \min_count_reg[1]  ( .D(n279), .CK(CLK), .RN(n440), .QN(n145) );
  DFFSX1 \min_count_reg[0]  ( .D(n280), .CK(CLK), .SN(n442), .QN(n146) );
  DFFSX2 \perm_reg[7][1]  ( .D(n344), .CK(CLK), .SN(n479), .QN(n106) );
  DFFSX2 \perm_reg[6][2]  ( .D(n387), .CK(CLK), .SN(n479), .Q(\perm[6][2] ), 
        .QN(n102) );
  DFFSX2 \perm_reg[7][0]  ( .D(n345), .CK(CLK), .SN(n479), .QN(n107) );
  AOI221XL U257 ( .A0(n103), .A1(\perm_ext[0][1] ), .B0(n104), .B1(
        \perm_ext[0][0] ), .C0(n252), .Y(n246) );
  CLKINVX1 U258 ( .A(RST), .Y(n479) );
  OAI221XL U259 ( .A0(\perm[6][1] ), .A1(n106), .B0(\perm[6][0] ), .B1(n107), 
        .C0(n251), .Y(n250) );
  OAI32XL U260 ( .A0(n206), .A1(n485), .A2(n23), .B0(n207), .B1(n17), .Y(n340)
         );
  OAI211XL U261 ( .A0(n208), .A1(n422), .B0(n23), .C0(n211), .Y(n212) );
  AOI2BB2XL U262 ( .B0(n23), .B1(n208), .A0N(n23), .A1N(n495), .Y(n210) );
  INVX16 U263 ( .A(n146), .Y(MatchCount[0]) );
  INVX16 U264 ( .A(n145), .Y(MatchCount[1]) );
  INVX16 U265 ( .A(n144), .Y(MatchCount[2]) );
  INVX12 U266 ( .A(n394), .Y(MatchCount[3]) );
  INVX12 U267 ( .A(n396), .Y(MinCost[5]) );
  INVX12 U268 ( .A(n476), .Y(MinCost[1]) );
  OAI22X2 U269 ( .A0(psum[9]), .A1(n412), .B0(n477), .B1(n469), .Y(N303) );
  BUFX12 U270 ( .A(n509), .Y(Valid) );
  BUFX12 U271 ( .A(n513), .Y(J[2]) );
  BUFX12 U272 ( .A(n514), .Y(J[1]) );
  BUFX12 U273 ( .A(n515), .Y(J[0]) );
  BUFX12 U274 ( .A(n510), .Y(W[2]) );
  BUFX12 U275 ( .A(n511), .Y(W[1]) );
  BUFX12 U276 ( .A(n512), .Y(W[0]) );
  INVX12 U277 ( .A(n406), .Y(MinCost[6]) );
  INVX12 U278 ( .A(n408), .Y(MinCost[2]) );
  INVX12 U279 ( .A(n410), .Y(MinCost[7]) );
  INVX12 U280 ( .A(n412), .Y(MinCost[9]) );
  INVX16 U281 ( .A(n414), .Y(MinCost[0]) );
  INVX12 U282 ( .A(n416), .Y(MinCost[3]) );
  INVX16 U283 ( .A(n418), .Y(MinCost[4]) );
  INVX12 U284 ( .A(n420), .Y(MinCost[8]) );
  AOI32XL U285 ( .A0(n468), .A1(n478), .A2(n467), .B0(n502), .B1(n74), .Y(n469) );
  NAND3BXL U286 ( .AN(N303), .B(n471), .C(n470), .Y(n474) );
  AO21XL U287 ( .A0(n81), .A1(n459), .B0(n507), .Y(n458) );
  NOR2BXL U288 ( .AN(n508), .B(psum[0]), .Y(n459) );
  NOR2BXL U289 ( .AN(psum[3]), .B(n506), .Y(n473) );
  NOR2XL U290 ( .A(n78), .B(n505), .Y(n472) );
  NOR2XL U291 ( .A(n77), .B(n504), .Y(n464) );
  NOR2XL U292 ( .A(n74), .B(n502), .Y(n457) );
  NOR2BXL U293 ( .AN(psum[0]), .B(MinCost[0]), .Y(n454) );
  NOR2X1 U294 ( .A(n240), .B(n495), .Y(n231) );
  OA21XL U295 ( .A0(n497), .A1(n181), .B0(n191), .Y(n188) );
  OAI21X1 U296 ( .A0(n246), .A1(n245), .B0(n213), .Y(n173) );
  OAI21XL U297 ( .A0(n224), .A1(n494), .B0(n490), .Y(n242) );
  NAND2X1 U298 ( .A(n172), .B(n181), .Y(n190) );
  CLKINVX1 U299 ( .A(n450), .Y(n453) );
  NOR3X1 U300 ( .A(perm_state[1]), .B(perm_state[2]), .C(n42), .Y(n213) );
  NOR3X1 U301 ( .A(perm_state[0]), .B(perm_state[2]), .C(n41), .Y(n214) );
  NOR3X1 U302 ( .A(n42), .B(perm_state[2]), .C(n41), .Y(n247) );
  NOR2X1 U303 ( .A(n234), .B(turn_count[2]), .Y(n224) );
  CLKINVX1 U304 ( .A(n240), .Y(n481) );
  CLKINVX1 U305 ( .A(n427), .Y(n480) );
  INVX3 U306 ( .A(n231), .Y(n482) );
  CLKINVX1 U307 ( .A(n220), .Y(n486) );
  CLKBUFX3 U308 ( .A(n491), .Y(n445) );
  CLKBUFX3 U309 ( .A(n491), .Y(n444) );
  CLKBUFX3 U310 ( .A(n188), .Y(n448) );
  CLKBUFX3 U311 ( .A(n188), .Y(n449) );
  CLKINVX1 U312 ( .A(n215), .Y(n483) );
  NAND3X1 U313 ( .A(n173), .B(n492), .C(n483), .Y(n240) );
  CLKBUFX3 U314 ( .A(n233), .Y(n427) );
  NAND2X1 U315 ( .A(n481), .B(n242), .Y(n233) );
  CLKBUFX3 U316 ( .A(n235), .Y(n428) );
  AND2X2 U317 ( .A(n174), .B(n481), .Y(n235) );
  CLKINVX1 U318 ( .A(n211), .Y(n485) );
  CLKINVX1 U319 ( .A(n225), .Y(n488) );
  CLKINVX1 U320 ( .A(n217), .Y(n487) );
  NOR2X1 U321 ( .A(n225), .B(n215), .Y(n243) );
  AND3X2 U322 ( .A(n201), .B(n226), .C(n243), .Y(n229) );
  NAND2X1 U323 ( .A(n173), .B(n495), .Y(n220) );
  CLKBUFX3 U324 ( .A(n236), .Y(n423) );
  AND2X2 U325 ( .A(n174), .B(n486), .Y(n236) );
  CLKBUFX3 U326 ( .A(n202), .Y(n426) );
  NOR3BXL U327 ( .AN(n201), .B(n244), .C(n215), .Y(n202) );
  CLKINVX1 U328 ( .A(n208), .Y(n491) );
  CLKINVX1 U329 ( .A(n218), .Y(n489) );
  NAND2X1 U330 ( .A(n244), .B(n490), .Y(n226) );
  CLKBUFX3 U331 ( .A(n237), .Y(n424) );
  NAND2X1 U332 ( .A(n486), .B(n242), .Y(n237) );
  NAND4X1 U333 ( .A(n488), .B(n483), .C(n174), .D(n444), .Y(next_perm_state[0]) );
  CLKBUFX3 U334 ( .A(n190), .Y(n446) );
  CLKBUFX3 U335 ( .A(n190), .Y(n447) );
  NAND3X1 U336 ( .A(n494), .B(n444), .C(n173), .Y(next_perm_state[1]) );
  CLKINVX1 U337 ( .A(n180), .Y(n496) );
  NAND2X1 U338 ( .A(n451), .B(n497), .Y(n191) );
  INVX3 U339 ( .A(n453), .Y(n451) );
  AND2X2 U340 ( .A(n191), .B(n497), .Y(n189) );
  CLKINVX1 U341 ( .A(n181), .Y(n493) );
  OAI21XL U342 ( .A0(n493), .A1(n497), .B0(n180), .Y(next_adder_state[0]) );
  INVX3 U343 ( .A(n453), .Y(n452) );
  CLKBUFX3 U344 ( .A(n431), .Y(n441) );
  CLKBUFX3 U345 ( .A(n431), .Y(n442) );
  CLKBUFX3 U346 ( .A(n431), .Y(n443) );
  CLKBUFX3 U347 ( .A(n431), .Y(n440) );
  CLKBUFX3 U348 ( .A(n431), .Y(n439) );
  CLKBUFX3 U349 ( .A(n431), .Y(n438) );
  CLKBUFX3 U350 ( .A(n431), .Y(n437) );
  CLKBUFX3 U351 ( .A(n431), .Y(n435) );
  CLKBUFX3 U352 ( .A(n479), .Y(n434) );
  CLKBUFX3 U353 ( .A(n431), .Y(n433) );
  CLKBUFX3 U354 ( .A(n431), .Y(n432) );
  CLKBUFX3 U355 ( .A(n431), .Y(n436) );
  OAI2BB1X1 U356 ( .A0N(N304), .A1N(n199), .B0(n430), .Y(n197) );
  CLKBUFX3 U357 ( .A(n200), .Y(n430) );
  NAND2XL U358 ( .A(N303), .B(n199), .Y(n200) );
  NOR2X2 U359 ( .A(n495), .B(n176), .Y(n215) );
  CLKINVX1 U360 ( .A(n422), .Y(n495) );
  NOR3X1 U361 ( .A(n213), .B(n214), .C(n215), .Y(n211) );
  CLKBUFX3 U362 ( .A(n203), .Y(n425) );
  NAND2X1 U363 ( .A(n422), .B(n483), .Y(n203) );
  NOR3X1 U364 ( .A(n245), .B(n246), .C(n490), .Y(n225) );
  OAI21XL U365 ( .A0(n224), .A1(n494), .B0(n488), .Y(n217) );
  CLKINVX1 U366 ( .A(n213), .Y(n490) );
  CLKINVX1 U367 ( .A(n214), .Y(n494) );
  NOR2X2 U368 ( .A(n492), .B(n248), .Y(n208) );
  CLKINVX1 U369 ( .A(n247), .Y(n492) );
  OAI21X1 U370 ( .A0(n208), .A1(n213), .B0(n243), .Y(n228) );
  OAI211X1 U371 ( .A0(n214), .A1(n226), .B0(n201), .C0(n174), .Y(n218) );
  NOR2X1 U372 ( .A(n247), .B(n422), .Y(n244) );
  NAND2X1 U373 ( .A(n243), .B(n422), .Y(n227) );
  NAND2X1 U374 ( .A(n214), .B(n224), .Y(n174) );
  NAND2X1 U375 ( .A(n248), .B(n247), .Y(n201) );
  NAND2X1 U376 ( .A(n171), .B(n201), .Y(n181) );
  AND2X2 U377 ( .A(n429), .B(n453), .Y(n205) );
  NAND2X1 U378 ( .A(n453), .B(n179), .Y(n180) );
  CLKINVX1 U379 ( .A(n172), .Y(n497) );
  NOR2X1 U380 ( .A(n451), .B(n179), .Y(next_adder_state[1]) );
  CLKBUFX3 U381 ( .A(n479), .Y(n431) );
  OAI2BB2XL U382 ( .B0(n429), .B1(n73), .A0N(N301), .A1N(n205), .Y(n330) );
  OAI2BB2XL U383 ( .B0(n429), .B1(n74), .A0N(N300), .A1N(n205), .Y(n339) );
  CLKINVX1 U384 ( .A(n471), .Y(n477) );
  CLKINVX1 U385 ( .A(n457), .Y(n478) );
  OA21XL U386 ( .A0(N303), .A1(MatchCount[1]), .B0(n196), .Y(n195) );
  OA21XL U387 ( .A0(N303), .A1(MatchCount[0]), .B0(n197), .Y(n196) );
  OAI2BB1XL U388 ( .A0N(n500), .A1N(n192), .B0(n193), .Y(n277) );
  OR4XL U389 ( .A(n500), .B(n144), .C(n145), .D(n194), .Y(n193) );
  OAI21XL U390 ( .A0(N303), .A1(MatchCount[2]), .B0(n195), .Y(n192) );
  OAI2BB2XL U391 ( .B0(n429), .B1(n75), .A0N(N299), .A1N(n205), .Y(n331) );
  NAND3BXL U392 ( .AN(N303), .B(n197), .C(MatchCount[0]), .Y(n194) );
  OAI32XL U393 ( .A0(n145), .A1(MatchCount[2]), .A2(n194), .B0(n195), .B1(n144), .Y(n278) );
  OAI2BB2XL U394 ( .B0(n429), .B1(n76), .A0N(N298), .A1N(n205), .Y(n332) );
  OAI22XL U395 ( .A0(n196), .A1(n145), .B0(MatchCount[1]), .B1(n194), .Y(n279)
         );
  OAI2BB2XL U396 ( .B0(n429), .B1(n77), .A0N(N297), .A1N(n205), .Y(n333) );
  OAI21XL U397 ( .A0(n146), .A1(n197), .B0(n198), .Y(n280) );
  OAI21XL U398 ( .A0(N303), .A1(n146), .B0(n197), .Y(n198) );
  OAI2BB2XL U399 ( .B0(n429), .B1(n78), .A0N(N296), .A1N(n205), .Y(n334) );
  OAI2BB2XL U400 ( .B0(n429), .B1(n79), .A0N(N295), .A1N(n205), .Y(n335) );
  OAI2BB2XL U401 ( .B0(n430), .B1(n79), .A0N(MinCost[3]), .A1N(n430), .Y(n323)
         );
  OAI2BB2XL U402 ( .B0(n430), .B1(n81), .A0N(MinCost[1]), .A1N(n430), .Y(n321)
         );
  OAI2BB2XL U403 ( .B0(n430), .B1(n74), .A0N(n502), .A1N(n430), .Y(n328) );
  OAI2BB2XL U404 ( .B0(n430), .B1(n77), .A0N(n504), .A1N(n430), .Y(n325) );
  OAI2BB2XL U405 ( .B0(n430), .B1(n78), .A0N(MinCost[4]), .A1N(n430), .Y(n324)
         );
  OAI2BB2XL U406 ( .B0(n430), .B1(n82), .A0N(MinCost[0]), .A1N(n430), .Y(n320)
         );
  OAI2BB2XL U407 ( .B0(n430), .B1(n73), .A0N(n501), .A1N(n430), .Y(n329) );
  OAI2BB2XL U408 ( .B0(n430), .B1(n75), .A0N(n503), .A1N(n430), .Y(n327) );
  OAI2BB2XL U409 ( .B0(n430), .B1(n76), .A0N(MinCost[6]), .A1N(n430), .Y(n326)
         );
  OAI2BB2XL U410 ( .B0(n430), .B1(n80), .A0N(MinCost[2]), .A1N(n430), .Y(n322)
         );
  OAI2BB2XL U411 ( .B0(n429), .B1(n80), .A0N(N294), .A1N(n205), .Y(n336) );
  OAI2BB2XL U412 ( .B0(n429), .B1(n81), .A0N(N293), .A1N(n205), .Y(n337) );
  OAI2BB2XL U413 ( .B0(n429), .B1(n82), .A0N(N292), .A1N(n205), .Y(n338) );
  OAI211X1 U414 ( .A0(\perm[7][2] ), .A1(n102), .B0(n249), .C0(n250), .Y(n176)
         );
  NAND3X1 U415 ( .A(n251), .B(n106), .C(\perm[6][1] ), .Y(n249) );
  NAND2X1 U416 ( .A(\perm[7][2] ), .B(n102), .Y(n251) );
  OAI221XL U417 ( .A0(n238), .A1(n24), .B0(n498), .B1(n427), .C0(n239), .Y(
        n384) );
  CLKINVX1 U418 ( .A(n224), .Y(n498) );
  NAND4X1 U419 ( .A(n231), .B(turn_count[1]), .C(turn_count[0]), .D(n24), .Y(
        n239) );
  AOI211X1 U420 ( .A0(n480), .A1(n234), .B0(n240), .C0(n241), .Y(n238) );
  CLKBUFX3 U421 ( .A(n177), .Y(n422) );
  NOR3X1 U422 ( .A(perm_state[1]), .B(perm_state[2]), .C(perm_state[0]), .Y(
        n177) );
  OAI222XL U423 ( .A0(n482), .A1(n117), .B0(n427), .B1(n123), .C0(n428), .C1(
        n120), .Y(n355) );
  OAI222XL U424 ( .A0(n482), .A1(n114), .B0(n427), .B1(n120), .C0(n428), .C1(
        n117), .Y(n358) );
  OAI222XL U425 ( .A0(n482), .A1(n111), .B0(n427), .B1(n117), .C0(n428), .C1(
        n114), .Y(n361) );
  OAI222XL U426 ( .A0(n108), .A1(n482), .B0(n427), .B1(n114), .C0(n428), .C1(
        n111), .Y(n364) );
  OAI222XL U427 ( .A0(n105), .A1(n482), .B0(n427), .B1(n111), .C0(n428), .C1(
        n108), .Y(n383) );
  OAI222XL U428 ( .A0(n482), .A1(n119), .B0(n427), .B1(n125), .C0(n428), .C1(
        n122), .Y(n353) );
  OAI222XL U429 ( .A0(n482), .A1(n116), .B0(n427), .B1(n122), .C0(n428), .C1(
        n119), .Y(n356) );
  OAI222XL U430 ( .A0(n482), .A1(n113), .B0(n427), .B1(n119), .C0(n428), .C1(
        n116), .Y(n359) );
  OAI222XL U431 ( .A0(n110), .A1(n482), .B0(n427), .B1(n116), .C0(n428), .C1(
        n113), .Y(n362) );
  OAI222XL U432 ( .A0(n107), .A1(n482), .B0(n427), .B1(n113), .C0(n428), .C1(
        n110), .Y(n365) );
  OAI222XL U433 ( .A0(n482), .A1(n118), .B0(n427), .B1(n124), .C0(n428), .C1(
        n121), .Y(n354) );
  OAI222XL U434 ( .A0(n482), .A1(n115), .B0(n427), .B1(n121), .C0(n428), .C1(
        n118), .Y(n357) );
  OAI222XL U435 ( .A0(n482), .A1(n112), .B0(n427), .B1(n118), .C0(n428), .C1(
        n115), .Y(n360) );
  OAI222XL U436 ( .A0(n109), .A1(n482), .B0(n427), .B1(n115), .C0(n428), .C1(
        n112), .Y(n363) );
  OAI222XL U437 ( .A0(n106), .A1(n482), .B0(n427), .B1(n112), .C0(n428), .C1(
        n109), .Y(n366) );
  OAI21XL U438 ( .A0(n481), .A1(n30), .B0(n230), .Y(n348) );
  OAI21XL U439 ( .A0(n480), .A1(n231), .B0(n30), .Y(n230) );
  OAI22XL U440 ( .A0(n428), .A1(n123), .B0(n482), .B1(n120), .Y(n352) );
  OAI22XL U441 ( .A0(n428), .A1(n125), .B0(n482), .B1(n122), .Y(n350) );
  OAI22XL U442 ( .A0(n428), .A1(n124), .B0(n482), .B1(n121), .Y(n351) );
  AOI221XL U443 ( .A0(n208), .A1(shift_count[0]), .B0(n23), .B1(n422), .C0(
        n485), .Y(n209) );
  NAND3X1 U444 ( .A(n422), .B(n17), .C(shift_count[1]), .Y(n206) );
  AOI221XL U445 ( .A0(n208), .A1(shift_count[1]), .B0(n422), .B1(n22), .C0(
        n484), .Y(n207) );
  CLKINVX1 U446 ( .A(n209), .Y(n484) );
  OAI222XL U447 ( .A0(n232), .A1(n482), .B0(n499), .B1(n427), .C0(n481), .C1(
        n29), .Y(n349) );
  CLKINVX1 U448 ( .A(n232), .Y(n499) );
  OAI21XL U449 ( .A0(n30), .A1(n29), .B0(n234), .Y(n232) );
  OAI32X1 U450 ( .A0(n485), .A1(shift_count[1]), .A2(n210), .B0(n209), .B1(n22), .Y(n341) );
  OAI222XL U451 ( .A0(n102), .A1(n444), .B0(n96), .B1(n425), .C0(n426), .C1(
        n99), .Y(n388) );
  OAI222XL U452 ( .A0(n92), .A1(n444), .B0(n86), .B1(n425), .C0(n426), .C1(n89), .Y(n310) );
  OAI222XL U453 ( .A0(n98), .A1(n445), .B0(n92), .B1(n425), .C0(n426), .C1(n95), .Y(n316) );
  OAI222XL U454 ( .A0(n104), .A1(n444), .B0(n98), .B1(n425), .C0(n426), .C1(
        n101), .Y(n386) );
  OAI222XL U455 ( .A0(n94), .A1(n444), .B0(n88), .B1(n425), .C0(n426), .C1(n91), .Y(n312) );
  OAI222XL U456 ( .A0(n97), .A1(n444), .B0(n91), .B1(n425), .C0(n426), .C1(n94), .Y(n315) );
  OAI222XL U457 ( .A0(n99), .A1(n444), .B0(n93), .B1(n425), .C0(n426), .C1(n96), .Y(n317) );
  OAI22XL U458 ( .A0(n215), .A1(n219), .B0(n106), .B1(n483), .Y(n344) );
  AOI221XL U459 ( .A0(\perm_turn[0][1] ), .A1(n208), .B0(\perm[6][1] ), .B1(
        n220), .C0(n221), .Y(n219) );
  OAI22XL U460 ( .A0(n489), .A1(n106), .B0(n487), .B1(n109), .Y(n221) );
  OAI22XL U461 ( .A0(n215), .A1(n222), .B0(n107), .B1(n483), .Y(n345) );
  AOI221XL U462 ( .A0(\perm_turn[0][0] ), .A1(n208), .B0(\perm[6][0] ), .B1(
        n220), .C0(n223), .Y(n222) );
  OAI22XL U463 ( .A0(n489), .A1(n107), .B0(n487), .B1(n110), .Y(n223) );
  OAI222XL U464 ( .A0(n91), .A1(n444), .B0(n85), .B1(n425), .C0(n426), .C1(n88), .Y(n309) );
  OAI222XL U465 ( .A0(n90), .A1(n444), .B0(n84), .B1(n425), .C0(n426), .C1(n87), .Y(n308) );
  OAI222XL U466 ( .A0(n95), .A1(n444), .B0(n89), .B1(n425), .C0(n426), .C1(n92), .Y(n313) );
  OAI222XL U467 ( .A0(n101), .A1(n445), .B0(n95), .B1(n425), .C0(n426), .C1(
        n98), .Y(n319) );
  OAI222XL U468 ( .A0(n100), .A1(n445), .B0(n94), .B1(n425), .C0(n426), .C1(
        n97), .Y(n318) );
  OAI222XL U469 ( .A0(n103), .A1(n444), .B0(n97), .B1(n425), .C0(n426), .C1(
        n100), .Y(n385) );
  OAI222XL U470 ( .A0(n93), .A1(n444), .B0(n87), .B1(n425), .C0(n426), .C1(n90), .Y(n311) );
  OAI222XL U471 ( .A0(n96), .A1(n444), .B0(n90), .B1(n425), .C0(n426), .C1(n93), .Y(n314) );
  OAI32X1 U472 ( .A0(n103), .A1(\perm_ext[0][1] ), .A2(n252), .B0(
        \perm_ext[0][2] ), .B1(n102), .Y(n245) );
  NOR2X1 U473 ( .A(n108), .B(\perm[6][2] ), .Y(n252) );
  OAI221XL U474 ( .A0(n486), .A1(n102), .B0(n105), .B1(n483), .C0(n216), .Y(
        n343) );
  AOI222XL U475 ( .A0(\perm_turn[0][2] ), .A1(n208), .B0(\perm_ext[0][2] ), 
        .B1(n217), .C0(\perm[7][2] ), .C1(n218), .Y(n216) );
  OAI222XL U476 ( .A0(n101), .A1(n227), .B0(n107), .B1(n228), .C0(n229), .C1(
        n104), .Y(n347) );
  OAI222XL U477 ( .A0(n424), .A1(n136), .B0(n445), .B1(n142), .C0(n423), .C1(
        n139), .Y(n370) );
  OAI222XL U478 ( .A0(n424), .A1(n133), .B0(n445), .B1(n139), .C0(n423), .C1(
        n136), .Y(n373) );
  OAI222XL U479 ( .A0(n424), .A1(n130), .B0(n445), .B1(n136), .C0(n423), .C1(
        n133), .Y(n376) );
  OAI222XL U480 ( .A0(n127), .A1(n424), .B0(n445), .B1(n133), .C0(n423), .C1(
        n130), .Y(n379) );
  OAI222XL U481 ( .A0(n106), .A1(n424), .B0(n445), .B1(n130), .C0(n423), .C1(
        n127), .Y(n382) );
  OAI222XL U482 ( .A0(n424), .A1(n135), .B0(n445), .B1(n141), .C0(n423), .C1(
        n138), .Y(n371) );
  OAI222XL U483 ( .A0(n424), .A1(n132), .B0(n445), .B1(n138), .C0(n423), .C1(
        n135), .Y(n374) );
  OAI222XL U484 ( .A0(n424), .A1(n129), .B0(n445), .B1(n135), .C0(n423), .C1(
        n132), .Y(n377) );
  OAI222XL U485 ( .A0(n126), .A1(n424), .B0(n445), .B1(n132), .C0(n423), .C1(
        n129), .Y(n380) );
  OAI222XL U486 ( .A0(n105), .A1(n424), .B0(n445), .B1(n129), .C0(n423), .C1(
        n126), .Y(n389) );
  OAI222XL U487 ( .A0(n107), .A1(n424), .B0(n445), .B1(n131), .C0(n423), .C1(
        n128), .Y(n381) );
  OAI222XL U488 ( .A0(n128), .A1(n424), .B0(n445), .B1(n134), .C0(n423), .C1(
        n131), .Y(n378) );
  OAI222XL U489 ( .A0(n424), .A1(n131), .B0(n445), .B1(n137), .C0(n423), .C1(
        n134), .Y(n375) );
  OAI222XL U490 ( .A0(n424), .A1(n134), .B0(n445), .B1(n140), .C0(n423), .C1(
        n137), .Y(n372) );
  OAI222XL U491 ( .A0(n424), .A1(n137), .B0(n445), .B1(n143), .C0(n423), .C1(
        n140), .Y(n369) );
  OAI222XL U492 ( .A0(n100), .A1(n227), .B0(n106), .B1(n228), .C0(n229), .C1(
        n103), .Y(n346) );
  OAI222XL U493 ( .A0(n99), .A1(n227), .B0(n105), .B1(n228), .C0(n229), .C1(
        n102), .Y(n387) );
  NOR2BX1 U494 ( .AN(adder_state[1]), .B(adder_state[0]), .Y(n199) );
  OAI22XL U495 ( .A0(n423), .A1(n142), .B0(n424), .B1(n139), .Y(n367) );
  OAI22XL U496 ( .A0(n423), .A1(n141), .B0(n424), .B1(n138), .Y(n368) );
  OAI22XL U497 ( .A0(n423), .A1(n143), .B0(n424), .B1(n140), .Y(n390) );
  OAI22XL U498 ( .A0(n426), .A1(n86), .B0(n89), .B1(n444), .Y(n307) );
  OAI22XL U499 ( .A0(n426), .A1(n85), .B0(n88), .B1(n444), .Y(n306) );
  OAI22XL U500 ( .A0(n426), .A1(n84), .B0(n87), .B1(n444), .Y(n305) );
  OAI21XL U501 ( .A0(n211), .A1(n23), .B0(n212), .Y(n342) );
  OAI222XL U502 ( .A0(n107), .A1(n446), .B0(n452), .B1(n51), .C0(n449), .C1(
        n72), .Y(n304) );
  OAI222XL U503 ( .A0(n103), .A1(n446), .B0(n452), .B1(n71), .C0(n449), .C1(
        n68), .Y(n300) );
  OAI222XL U504 ( .A0(n106), .A1(n446), .B0(n451), .B1(n50), .C0(n449), .C1(
        n71), .Y(n303) );
  OAI222XL U505 ( .A0(n102), .A1(n446), .B0(n450), .B1(n70), .C0(n449), .C1(
        n67), .Y(n299) );
  OAI222XL U506 ( .A0(n105), .A1(n446), .B0(n450), .B1(n49), .C0(n449), .C1(
        n70), .Y(n302) );
  OAI222XL U507 ( .A0(n446), .A1(n89), .B0(n450), .B1(n57), .C0(n448), .C1(n54), .Y(n286) );
  OAI222XL U508 ( .A0(n446), .A1(n104), .B0(n450), .B1(n72), .C0(n449), .C1(
        n69), .Y(n301) );
  OAI222XL U509 ( .A0(n446), .A1(n86), .B0(n452), .B1(n54), .C0(n448), .C1(n51), .Y(n283) );
  OAI222XL U510 ( .A0(n446), .A1(n88), .B0(n452), .B1(n56), .C0(n448), .C1(n53), .Y(n285) );
  OAI222XL U511 ( .A0(n446), .A1(n91), .B0(n450), .B1(n59), .C0(n448), .C1(n56), .Y(n288) );
  OAI222XL U512 ( .A0(n446), .A1(n85), .B0(n452), .B1(n53), .C0(n448), .C1(n50), .Y(n282) );
  OAI222XL U513 ( .A0(n446), .A1(n84), .B0(n452), .B1(n52), .C0(n448), .C1(n49), .Y(n281) );
  OAI222XL U514 ( .A0(n446), .A1(n87), .B0(n452), .B1(n55), .C0(n448), .C1(n52), .Y(n284) );
  OAI222XL U515 ( .A0(n447), .A1(n92), .B0(n450), .B1(n60), .C0(n448), .C1(n57), .Y(n289) );
  OAI222XL U516 ( .A0(n447), .A1(n95), .B0(n450), .B1(n63), .C0(n448), .C1(n60), .Y(n292) );
  OAI222XL U517 ( .A0(n447), .A1(n98), .B0(n178), .B1(n66), .C0(n448), .C1(n63), .Y(n295) );
  OAI222XL U518 ( .A0(n447), .A1(n101), .B0(n178), .B1(n69), .C0(n449), .C1(
        n66), .Y(n298) );
  OAI222XL U519 ( .A0(n447), .A1(n94), .B0(n178), .B1(n62), .C0(n448), .C1(n59), .Y(n291) );
  OAI222XL U520 ( .A0(n447), .A1(n97), .B0(n178), .B1(n65), .C0(n448), .C1(n62), .Y(n294) );
  OAI222XL U521 ( .A0(n447), .A1(n100), .B0(n178), .B1(n68), .C0(n448), .C1(
        n65), .Y(n297) );
  OAI222XL U522 ( .A0(n447), .A1(n90), .B0(n450), .B1(n58), .C0(n448), .C1(n55), .Y(n287) );
  OAI222XL U523 ( .A0(n447), .A1(n93), .B0(n450), .B1(n61), .C0(n448), .C1(n58), .Y(n290) );
  OAI222XL U524 ( .A0(n447), .A1(n96), .B0(n452), .B1(n64), .C0(n448), .C1(n61), .Y(n293) );
  OAI222XL U525 ( .A0(n447), .A1(n99), .B0(n450), .B1(n67), .C0(n448), .C1(n64), .Y(n296) );
  CLKBUFX3 U526 ( .A(n178), .Y(n450) );
  NAND2BX1 U527 ( .AN(adder_state[1]), .B(adder_state[0]), .Y(n178) );
  CLKBUFX3 U528 ( .A(n204), .Y(n429) );
  AOI31X1 U529 ( .A0(n453), .A1(n46), .A2(n187), .B0(n199), .Y(n204) );
  NAND2X1 U530 ( .A(n29), .B(n30), .Y(n234) );
  NOR3X1 U531 ( .A(shift_count[1]), .B(shift_count[2]), .C(shift_count[0]), 
        .Y(n248) );
  NOR3X1 U532 ( .A(adder_count[1]), .B(adder_count[2]), .C(adder_count[0]), 
        .Y(n187) );
  AOI21X1 U533 ( .A0(n48), .A1(n496), .B0(next_adder_count[0]), .Y(n184) );
  NAND2X1 U534 ( .A(adder_count[3]), .B(n187), .Y(n179) );
  OAI32X1 U535 ( .A0(n182), .A1(n48), .A2(n47), .B0(n183), .B1(n46), .Y(
        next_adder_count[3]) );
  NAND3X1 U536 ( .A(n496), .B(n46), .C(adder_count[0]), .Y(n182) );
  OA21XL U537 ( .A0(n180), .A1(adder_count[2]), .B0(n184), .Y(n183) );
  OAI22XL U538 ( .A0(n449), .A1(n148), .B0(n451), .B1(n151), .Y(n254) );
  OAI22XL U539 ( .A0(n449), .A1(n160), .B0(n451), .B1(n163), .Y(n266) );
  OAI22XL U540 ( .A0(n449), .A1(n147), .B0(n451), .B1(n150), .Y(n253) );
  OAI22XL U541 ( .A0(n449), .A1(n150), .B0(n451), .B1(n153), .Y(n256) );
  OAI22XL U542 ( .A0(n449), .A1(n153), .B0(n451), .B1(n156), .Y(n259) );
  OAI22XL U543 ( .A0(n449), .A1(n149), .B0(n451), .B1(n152), .Y(n255) );
  OAI22XL U544 ( .A0(n449), .A1(n155), .B0(n451), .B1(n158), .Y(n261) );
  OAI22XL U545 ( .A0(n449), .A1(n161), .B0(n451), .B1(n164), .Y(n267) );
  OAI22XL U546 ( .A0(n449), .A1(n167), .B0(n451), .B1(n170), .Y(n273) );
  OAI22XL U547 ( .A0(n449), .A1(n151), .B0(n451), .B1(n154), .Y(n257) );
  OAI22XL U548 ( .A0(n449), .A1(n163), .B0(n451), .B1(n166), .Y(n269) );
  OAI22XL U549 ( .A0(n449), .A1(n156), .B0(n451), .B1(n159), .Y(n262) );
  OAI221XL U550 ( .A0(n189), .A1(n170), .B0(n452), .B1(n149), .C0(n447), .Y(
        n276) );
  OAI221XL U551 ( .A0(n189), .A1(n169), .B0(n452), .B1(n148), .C0(n447), .Y(
        n275) );
  OAI221XL U552 ( .A0(n189), .A1(n152), .B0(n452), .B1(n155), .C0(n446), .Y(
        n258) );
  OAI221XL U553 ( .A0(n189), .A1(n158), .B0(n452), .B1(n161), .C0(n447), .Y(
        n264) );
  OAI221XL U554 ( .A0(n189), .A1(n164), .B0(n452), .B1(n167), .C0(n446), .Y(
        n270) );
  OAI221XL U555 ( .A0(n189), .A1(n154), .B0(n452), .B1(n157), .C0(n447), .Y(
        n260) );
  OAI221XL U556 ( .A0(n189), .A1(n157), .B0(n452), .B1(n160), .C0(n190), .Y(
        n263) );
  OAI221XL U557 ( .A0(n189), .A1(n166), .B0(n452), .B1(n169), .C0(n190), .Y(
        n272) );
  OAI221XL U558 ( .A0(n189), .A1(n159), .B0(n452), .B1(n162), .C0(n190), .Y(
        n265) );
  OAI221XL U559 ( .A0(n189), .A1(n162), .B0(n452), .B1(n165), .C0(n190), .Y(
        n268) );
  OAI221XL U560 ( .A0(n189), .A1(n165), .B0(n452), .B1(n168), .C0(n190), .Y(
        n271) );
  OAI221XL U561 ( .A0(n189), .A1(n168), .B0(n452), .B1(n147), .C0(n446), .Y(
        n274) );
  NOR2X1 U562 ( .A(n180), .B(adder_count[0]), .Y(next_adder_count[0]) );
  NOR2X1 U563 ( .A(adder_state[0]), .B(adder_state[1]), .Y(n172) );
  OAI21XL U564 ( .A0(n184), .A1(n47), .B0(n185), .Y(next_adder_count[2]) );
  NAND4X1 U565 ( .A(adder_count[1]), .B(adder_count[0]), .C(n496), .D(n47), 
        .Y(n185) );
  NAND3X1 U566 ( .A(n42), .B(n41), .C(perm_state[2]), .Y(n171) );
  OAI22XL U567 ( .A0(n171), .A1(n83), .B0(n172), .B1(n493), .Y(
        next_perm_state[2]) );
  OAI31XL U568 ( .A0(n175), .A1(n22), .A2(n17), .B0(n83), .Y(next_finished) );
  NAND3X1 U569 ( .A(n176), .B(n23), .C(n422), .Y(n175) );
  OA21XL U570 ( .A0(n30), .A1(n29), .B0(n422), .Y(n241) );
  NOR2X1 U571 ( .A(n186), .B(n180), .Y(next_adder_count[1]) );
  XNOR2X1 U572 ( .A(adder_count[0]), .B(adder_count[1]), .Y(n186) );
  OAI22XL U573 ( .A0(psum[1]), .A1(n454), .B0(n454), .B1(n476), .Y(n456) );
  NAND2X1 U574 ( .A(psum[7]), .B(n410), .Y(n468) );
  NAND2X1 U575 ( .A(psum[6]), .B(n406), .Y(n463) );
  NOR3BXL U576 ( .AN(n463), .B(n457), .C(n464), .Y(n455) );
  NAND3X1 U577 ( .A(n456), .B(n468), .C(n455), .Y(n475) );
  NAND2X1 U578 ( .A(psum[9]), .B(n412), .Y(n471) );
  NOR2X1 U579 ( .A(n473), .B(n472), .Y(n462) );
  NAND2X1 U580 ( .A(psum[2]), .B(n408), .Y(n470) );
  OAI211X1 U581 ( .A0(n459), .A1(n81), .B0(n458), .C0(n470), .Y(n460) );
  OAI221XL U582 ( .A0(psum[2]), .A1(n408), .B0(psum[3]), .B1(n416), .C0(n460), 
        .Y(n461) );
  AOI222XL U583 ( .A0(n504), .A1(n77), .B0(MinCost[4]), .B1(n78), .C0(n462), 
        .C1(n461), .Y(n466) );
  NAND2BX1 U584 ( .AN(n464), .B(n463), .Y(n465) );
  OAI222XL U585 ( .A0(n466), .A1(n465), .B0(psum[6]), .B1(n406), .C0(psum[7]), 
        .C1(n410), .Y(n467) );
  NOR4X1 U586 ( .A(n475), .B(n474), .C(n473), .D(n472), .Y(N304) );
endmodule

