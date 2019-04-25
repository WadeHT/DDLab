module cla_64bit( a, b, cin, sum, cout);

    input [63:0] a, b;
    input cin;
    output [63:0] s;
    output cout;

    wire [63:0] g;
    wire [63:0] p;
    wire [63:0] c;
    wire [15:0] gG,gP;
    wire [3:0] gGG,gPP;
    wire [15:0] c_4n;
    wire[3:0] c_16n;
    //write your design below
    //pg gen
    gp_generator 0_pg(.a(a[3:0])    , .b(b[3:0])    , .p(p[3:0])    , .g(g[3:0]));
    gp_generator 1_pg(.a(a[7:4])    , .b(b[7:4])    , .p(p[7:4])    , .g(g[7:4]));
    gp_generator 2_pg(.a(a[11:8])   , .b(b[11:8])   , .p(p[11:8])   , .g(g[11:8]));
    gp_generator 3_pg(.a(a[15:12])  , .b(b[15:12])   , .p(p[15:12])  , .g(g[15:12]));
    gp_generator 4_pg(.a(a[19:16])  , .b(b[19:16])   , .p(p[19:16])  , .g(g[19:16]));
    gp_generator 5_pg(.a(a[23:20])  , .b(b[23:20])   , .p(p[23:20])  , .g(g[23:20]));
    gp_generator 6_pg(.a(a[27:24])  , .b(b[27:24])   , .p(p[27:24])  , .g(g[27:24]));
    gp_generator 7_pg(.a(a[31:28])  , .b(b[31:28])   , .p(p[31:28])  , .g(g[31:28]));
    gp_generator 8_pg(.a(a[35:32])  , .b(b[35:32])   , .p(p[35:32])  , .g(g[35:32]));
    gp_generator 9_pg(.a(a[39:36])  , .b(b[39:36])   , .p(p[39:36])  , .g(g[39:36]));
    gp_generator 10_pg(.a(a[43:40]) , .b(b[43:40])   , .p(p[43:40])  , .g(g[43:40]));
    gp_generator 11_pg(.a(a[47:44]) , .b(b[47:44])   , .p(p[47:44])  , .g(g[47:44]));
    gp_generator 12_pg(.a(a[51:48]) , .b(b[51:48])   , .p(p[51:48])  , .g(g[51:48]));
    gp_generator 13_pg(.a(a[55:52]) , .b(b[55:52])   , .p(p[55:52])  , .g(g[55:52]));
    gp_generator 14_pg(.a(a[59:56]) , .b(b[59:56])   , .p(p[59:56])  , .g(g[59:56]));
    gp_generator 15_pg(.a(a[63:60]) , .b(b[63:60])   , .p(p[63:60])  , .g(g[63:60]));
    //PG_4bit gen
    carry_generator carry_gen_0(.p(p[3:0])      , .g(g[3:0])    ,  .gG(gG[0])   , .gP(gP[0]));
    carry_generator carry_gen_1(.p(p[7:4])      , .g(g[7:4])    ,  .gG(gG[1])   , .gP(gP[1]));
    carry_generator carry_gen_2(.p(p[11:8])     , .g(g[11:8])   ,  .gG(gG[2])   , .gP(gP[2]));
    carry_generator carry_gen_3(.p(p[15:12])    , .g(g[15:12])  ,  .gG(gG[3])   , .gP(gP[3]));
    carry_generator carry_gen_4(.p(p[19:16])    , .g(g[19:16])  ,  .gG(gG[4])   , .gP(gP[4]));
    carry_generator carry_gen_5(.p(p[23:20])    , .g(g[23:20])  ,  .gG(gG[5])   , .gP(gP[5]));
    carry_generator carry_gen_6(.p(p[27:24])    , .g(g[27:24])  ,  .gG(gG[6])   , .gP(gP[6]));
    carry_generator carry_gen_7(.p(p[31:28])    , .g(g[31:28])  ,  .gG(gG[7])   , .gP(gP[7]));
    carry_generator carry_gen_8(.p(p[35:32])    , .g(g[35:32])  ,  .gG(gG[8])   , .gP(gP[8]));
    carry_generator carry_gen_9(.p(p[39:36])    , .g(g[39:36])  ,  .gG(gG[9])   , .gP(gP[9]));
    carry_generator carry_gen_10(.p(p[43:40])   , .g(g[43:40])  ,  .gG(gG[10])  , .gP(gP[10]));
    carry_generator carry_gen_11(.p(p[47:44])   , .g(g[47:44])  ,  .gG(gG[11])  , .gP(gP[11]));
    carry_generator carry_gen_12(.p(p[51:48])   , .g(g[51:48])  ,  .gG(gG[12])  , .gP(gP[12]));
    carry_generator carry_gen_13(.p(p[55:52])   , .g(g[55:52])  ,  .gG(gG[13])  , .gP(gP[13]));
    carry_generator carry_gen_14(.p(p[59:56])   , .g(g[59:56])  ,  .gG(gG[14])  , .gP(gP[14]));
    carry_generator carry_gen_15(.p(p[63:60])   , .g(g[63:60])  ,  .gG(gG[15])  , .gP(gP[15]));
    //PG_16bit gen
    carry_generator carry_ggen_0(.p(gP[3:0])    , .g(gG[3:0])   , .gG(gGG[0]), .gP(gPP[0]));
    carry_generator carry_ggen_1(.p(gP[7:4])    , .g(gG[7:4])   , .gG(gGG[1]), .gP(gPP[1]));
    carry_generator carry_ggen_2(.p(gP[11:8])   , .g(gG[11:8])  , .gG(gGG[2]), .gP(gPP[2]));
    carry_generator carry_ggen_3(.p(gP[15:12])  , .g(gG[15:12]) , .gG(gGG[3]), .gP(gPP[3]));
    //carry_16n_bit
    carry_generator carry_ggen_3(.p(gPP), .g(gGG), .cin(cin), .c(c_16n[3:0]),cout(cout));
    //carry_4nbit
    carry_generator carry_gen_16(.p(gP[3:0])    , .g(gG[3:0])   ,.cin(cin)      , .c(c_4n[3:0]));
    carry_generator carry_gen_17(.p(gP[7:4])    , .g(gG[7:4])   ,.cin(c_16n[1]) , .c(c_4n[7:4]));
    carry_generator carry_gen_18(.p(gP[11:8])   , .g(gG[11:8])  ,.cin(c_16n[2]) , .c(c_4n[11:8]));
    carry_generator carry_gen_19(.p(gP[15:12])  , .g(gG[15:12]) ,.cin(c_16n[3]) , .c(c_4n[15:12]));
    //carry_n_bit
    carry_generator carry_gen_00(.p(p[3:0])   , .g(g[3:0])  , .cin(cin)     ,.c(c[3:0]));
    carry_generator carry_gen_01(.p(p[7:4])   , .g(g[7:4])  , .cin(c_4n[1]) ,.c(c[7:4]));
    carry_generator carry_gen_02(.p(p[11:8])  , .g(g[11:8]) , .cin(c_4n[2]) ,.c(c[11:8]));
    carry_generator carry_gen_03(.p(p[15:12]) , .g(g[15:12]), .cin(c_4n[3]) ,.c(c[15:12]));
    carry_generator carry_gen_04(.p(p[19:16]) , .g(g[19:16]), .cin(c_4n[4]) ,.c(c[19:16]));
    carry_generator carry_gen_05(.p(p[23:20]) , .g(g[23:20]), .cin(c_4n[5]) ,.c(c[23:20]));
    carry_generator carry_gen_06(.p(p[27:24]) , .g(g[27:24]), .cin(c_4n[6]) ,.c(c[27:24]));
    carry_generator carry_gen_07(.p(p[31:28]) , .g(g[31:28]), .cin(c_4n[7]) ,.c(c[31:28]));
    carry_generator carry_gen_08(.p(p[35:32]) , .g(g[35:32]), .cin(c_4n[8]) ,.c(c[35:32]));
    carry_generator carry_gen_09(.p(p[39:36]) , .g(g[39:36]), .cin(c_4n[9]) ,.c(c[39:36]));
    carry_generator carry_gen_010(.p(p[43:40]), .g(g[43:40]), .cin(c_4n[10]),.c(c[43:40]));
    carry_generator carry_gen_011(.p(p[47:44]), .g(g[47:44]), .cin(c_4n[11]),.c(c[47:44]));
    carry_generator carry_gen_012(.p(p[51:48]), .g(g[51:48]), .cin(c_4n[12]),.c(c[51:48]));
    carry_generator carry_gen_013(.p(p[55:52]), .g(g[55:52]), .cin(c_4n[13]),.c(c[55:52]));
    carry_generator carry_gen_014(.p(p[59:56]), .g(g[59:56]), .cin(c_4n[14]),.c(c[59:56]));
    carry_generator carry_gen_015(.p(p[63:60]), .g(g[63:60]), .cin(c_4n[15]),.c(c[63:60]));
    //sum
    sum_generator sum_0(.a(a[3:0])   , .b(b[3:0])  , .c(c[3:0])  , .s(s[3:0]) );
    sum_generator sum_1(.a(a[7:4])   , .b(b[7:4])  , .c(c[7:4])  , .s(s[7:4]) );
    sum_generator sum_2(.a(a[11:8])  , .b(b[11:8]) , .c(c[11:8]) , .s(s[11:8]) );
    sum_generator sum_3(.a(a[15:12]) , .b(b[15:12]), .c(c[15:12]), .s(s[15:12]) );
    sum_generator sum_4(.a(a[19:16]) , .b(b[19:16]), .c(c[19:16]), .s(s[19:16]) );
    sum_generator sum_5(.a(a[23:20]) , .b(b[23:20]), .c(c[23:20]), .s(s[23:20]) );
    sum_generator sum_6(.a(a[27:24]) , .b(b[27:24]), .c(c[27:24]), .s(s[27:24]) );
    sum_generator sum_7(.a(a[31:28]) , .b(b[31:28]), .c(c[31:28]), .s(s[31:28]) );
    sum_generator sum_8(.a(a[35:32]) , .b(b[35:32]), .c(c[35:32]), .s(s[35:32]) );
    sum_generator sum_9(.a(a[39:36]) , .b(b[39:36]), .c(c[39:36]), .s(s[39:36]) );
    sum_generator sum_10(.a(a[43:40]), .b(b[43:40]), .c(c[43:40]), .s(s[43:40]) );
    sum_generator sum_11(.a(a[47:44]), .b(b[47:44]), .c(c[47:44]), .s(s[47:44]) );
    sum_generator sum_12(.a(a[51:48]), .b(b[51:48]), .c(c[51:48]), .s(s[51:48]) );
    sum_generator sum_13(.a(a[55:52]), .b(b[55:52]), .c(c[55:52]), .s(s[55:52]) );
    sum_generator sum_14(.a(a[59:56]), .b(b[59:56]), .c(c[59:56]), .s(s[59:56]) );
    sum_generator sum_15(.a(a[63:60]), .b(b[63:60]), .c(c[63:60]), .s(s[63:60]) );

endmodule


//產生所需的小p小g
module gp_generator(a, b, p, g );
input [3:0] a,b;
output [3:0] p,g;

assign g[0] = a[0] & b[0];
assign p[0] = a[0] | b[0];

assign g[1] = a[1] & b[1];
assign p[1] = a[1] | b[1];

assign g[2] = a[2] & b[2];
assign p[2] = a[2] | b[2];

assign g[3] = a[3] & b[3];
assign p[3] = a[3] | b[3];

endmodule

//產生所需的carry in 跟 大G大P
module carry_generator( p, g, cin, c,gG,gP,cout);

input [3:0] p, g;
input cin;
output [3:0] c;
output gG, gP;
output cout;

assign gG = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0]);//G[3:0]
assign gP = p[3] & p[2] & p[1] & p[0];//P[3:0]

assign c[0] = cin;
assign c[1] = g[0] | (p[0] & cin);
assign c[2] = g[1] | (p[1] & g[0]) | (p[1] & p[0] & cin);
assign c[3] = g[2] | (p[2] & g[1]) | (p[2] & p[1] & g[0]) | (p[2] & p[1] & p[0] & cin);
assign cout = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0]) | (p[3] & p[2] & p[1] & p[0] & cin);

endmodule

//求得最後結果
module sum_generator(a, b, c, s );

input [3:0] a,b,c;
output [3:0] s;

assign s[0] = a[0] ^ b[0] ^ c[0];
assign s[1] = a[1] ^ b[1] ^ c[1];
assign s[2] = a[2] ^ b[2] ^ c[2];
assign s[3] = a[3] ^ b[3] ^ c[3];

endmodule



