(*
  agate_file_name = "/cygdrive/F/capital_micro/primace7.3/ast_frontend//../data/lib/syn_black_box_m7s.v:81",
  agate_format    = "VLOG"
*)
module M7S_PLL(clkin0, clkin1, fbclkin, pwrdown, pllrst, fp_pll_rst, ACTIVECK,
     CKBAD0, CKBAD1, clkout0, clkout1, clkout2, clkout3, locked);
input clkin0, clkin1, fbclkin, pwrdown, pllrst, fp_pll_rst;
output ACTIVECK, CKBAD0, CKBAD1, clkout0, clkout1, clkout2, clkout3, locked;

endmodule

(*
  agate_file_name = "/cygdrive/g/大创/Scaler/Scaler_With_LCD/outputs/../src/pll_v1.v:14",
  agate_format    = "VLOG"
*)
module pll_v1(clkin0, clkout0, clkout1, locked);
input clkin0;
output clkout0, clkout1, locked;

endmodule

(*
  agate_file_name = "/cygdrive/F/capital_micro/primace7.3/ast_frontend//../data/lib/syn_black_box_m7s.v:54",
  agate_format    = "VLOG"
*)
module M7S_DLL(clkin, pwrdown, dllrst, fp_dll_rst, clkout0, clkout1, clkout2,
     clkout3, dll_msel0_user, locked);
input clkin, pwrdown, dllrst, fp_dll_rst;
output clkout0, clkout1, clkout2, clkout3, locked;
input  [3:0] dll_msel0_user;

endmodule

(*
  agate_file_name = "/cygdrive/F/capital_micro/primace7.3/ast_frontend//../data/lib/syn_black_box_m7s.v:958",
  agate_format    = "VLOG"
*)
module M7S_SOC(c2r1_dll_clk, fp_clk_sys, fp_clk_adc, fp_clk_arm, fp_lvds_sclk,
     fp_clk_usb, gpio_0_out_o, gpio_0_oe_o, gpio_0_in_i, i2c1_scl_oe_o,
     i2c1_sda_oe_o, i2c1_scl_i, i2c1_sda_i, i2c0_scl_oe_o, i2c0_sda_oe_o,
     i2c0_scl_i, i2c0_sda_i, uart1_rts_o, uart1_txd_o, uart1_cts_i, uart1_rxd_i,
     uart0_rts_o, uart0_txd_o, uart0_cts_i, uart0_rxd_i, spi1_mosi, spi1_sck,
     spi1_ssn, spi1_miso, spi0_mosi, spi0_sck, spi0_ssn, spi0_miso,
     pad_can1_o_clk, pad_can1_o_tx1, pad_can1_o_tx0, pad_can1_oen_tx1,
     pad_can1_oen_tx0, pad_can1_i_rx0, pad_can0_o_clk, pad_can0_o_tx1,
     pad_can0_o_tx0, pad_can0_oen_tx1, pad_can0_oen_tx0, pad_can0_i_rx0,
     clk_ahb_fp0, rst_ahb_fp0_n, fp0_m_ahb_mastlock, fp0_m_ahb_prot,
     fp0_m_ahb_size, fp0_m_ahb_addr, fp0_m_ahb_write, fp0_m_ahb_burst,
     fp0_m_ahb_trans, fp0_m_ahb_wdata, fp0_m_ahb_ready, fp0_m_ahb_resp,
     fp0_m_ahb_rdata, fp0_s_ahb_mastlock, fp0_s_ahb_prot, fp0_s_ahb_size,
     fp0_s_ahb_sel, fp0_s_ahb_addr, fp0_s_ahb_write, fp0_s_ahb_burst,
     fp0_s_ahb_trans, fp0_s_ahb_wdata, fp0_s_ahb_readyout, fp0_s_ahb_resp,
     fp0_s_ahb_rdata, clk_ahb_fp1, rst_ahb_fp1_n, fp1_m_ahb_mastlock,
     fp1_m_ahb_prot, fp1_m_ahb_size, fp1_m_ahb_addr, fp1_m_ahb_write,
     fp1_m_ahb_burst, fp1_m_ahb_trans, fp1_m_ahb_wdata, fp1_m_ahb_ready,
     fp1_m_ahb_resp, fp1_m_ahb_rdata, fp1_s_ahb_mastlock, fp1_s_ahb_prot,
     fp1_s_ahb_size, fp1_s_ahb_sel, fp1_s_ahb_addr, fp1_s_ahb_write,
     fp1_s_ahb_burst, fp1_s_ahb_trans, fp1_s_ahb_wdata, fp1_s_ahb_readyout,
     fp1_s_ahb_resp, fp1_s_ahb_rdata, clk_eth_tx, fp2soc_rst_n, fp_INTNMI);
input c2r1_dll_clk, fp_clk_sys, fp_clk_adc, fp_clk_arm, fp_lvds_sclk,
     fp_clk_usb, i2c1_scl_i, i2c1_sda_i, i2c0_scl_i, i2c0_sda_i, uart1_cts_i,
     uart1_rxd_i, uart0_cts_i, uart0_rxd_i, spi1_miso, spi0_miso,
     pad_can1_i_rx0, pad_can0_i_rx0, clk_ahb_fp0, rst_ahb_fp0_n,
     fp0_m_ahb_mastlock, fp0_m_ahb_write, fp0_s_ahb_readyout, fp0_s_ahb_resp,
     clk_ahb_fp1, rst_ahb_fp1_n, fp1_m_ahb_mastlock, fp1_m_ahb_write,
     fp1_s_ahb_readyout, fp1_s_ahb_resp, clk_eth_tx, fp2soc_rst_n;
output i2c1_scl_oe_o, i2c1_sda_oe_o, i2c0_scl_oe_o, i2c0_sda_oe_o, uart1_rts_o,
     uart1_txd_o, uart0_rts_o, uart0_txd_o, spi1_mosi, spi1_sck, spi1_ssn,
     spi0_mosi, spi0_sck, spi0_ssn, pad_can1_o_clk, pad_can1_o_tx1,
     pad_can1_o_tx0, pad_can1_oen_tx1, pad_can1_oen_tx0, pad_can0_o_clk,
     pad_can0_o_tx1, pad_can0_o_tx0, pad_can0_oen_tx1, pad_can0_oen_tx0,
     fp0_m_ahb_ready, fp0_m_ahb_resp, fp0_s_ahb_mastlock, fp0_s_ahb_sel,
     fp0_s_ahb_write, fp1_m_ahb_ready, fp1_m_ahb_resp, fp1_s_ahb_mastlock,
     fp1_s_ahb_sel, fp1_s_ahb_write;
input  [31:0] gpio_0_in_i;
input  [3:0] fp0_m_ahb_prot;
input  [2:0] fp0_m_ahb_size;
input  [31:0] fp0_m_ahb_addr;
input  [2:0] fp0_m_ahb_burst;
input  [1:0] fp0_m_ahb_trans;
input  [31:0] fp0_m_ahb_wdata;
input  [31:0] fp0_s_ahb_rdata;
input  [3:0] fp1_m_ahb_prot;
input  [2:0] fp1_m_ahb_size;
input  [31:0] fp1_m_ahb_addr;
input  [2:0] fp1_m_ahb_burst;
input  [1:0] fp1_m_ahb_trans;
input  [31:0] fp1_m_ahb_wdata;
input  [31:0] fp1_s_ahb_rdata;
input  [15:0] fp_INTNMI;
output [31:0] gpio_0_out_o;
output [31:0] gpio_0_oe_o;
output [31:0] fp0_m_ahb_rdata;
output [3:0] fp0_s_ahb_prot;
output [2:0] fp0_s_ahb_size;
output [31:0] fp0_s_ahb_addr;
output [2:0] fp0_s_ahb_burst;
output [1:0] fp0_s_ahb_trans;
output [31:0] fp0_s_ahb_wdata;
output [31:0] fp1_m_ahb_rdata;
output [3:0] fp1_s_ahb_prot;
output [2:0] fp1_s_ahb_size;
output [31:0] fp1_s_ahb_addr;
output [2:0] fp1_s_ahb_burst;
output [1:0] fp1_s_ahb_trans;
output [31:0] fp1_s_ahb_wdata;

endmodule

(*
  agate_file_name = "/cygdrive/g/大创/Scaler/Scaler_With_LCD/outputs/../src/mcu_armcm3.v:15",
  agate_format    = "VLOG"
*)
module mcu_armcm3(fp2soc_rst_n, fp_clk_sys, fp_clk_arm, fp_clk_ddrc,
     gpio_0_out_o, gpio_0_oe_o, gpio_0_in_i, spi0_mosi, spi0_sck, spi0_ssn,
     spi0_miso, clk_ahb_fp0, rst_ahb_fp0_n, fp0_m_ahb_mastlock, fp0_m_ahb_prot,
     fp0_m_ahb_size, fp0_m_ahb_addr, fp0_m_ahb_write, fp0_m_ahb_burst,
     fp0_m_ahb_trans, fp0_m_ahb_wdata, fp0_m_ahb_ready, fp0_m_ahb_resp,
     fp0_m_ahb_rdata, fp0_s_ahb_mastlock, fp0_s_ahb_prot, fp0_s_ahb_size,
     fp0_s_ahb_sel, fp0_s_ahb_addr, fp0_s_ahb_write, fp0_s_ahb_burst,
     fp0_s_ahb_trans, fp0_s_ahb_wdata, fp0_s_ahb_readyout, fp0_s_ahb_resp,
     fp0_s_ahb_rdata);
input fp2soc_rst_n, fp_clk_sys, fp_clk_arm, fp_clk_ddrc, spi0_miso, clk_ahb_fp0,
     rst_ahb_fp0_n, fp0_m_ahb_mastlock, fp0_m_ahb_write, fp0_s_ahb_readyout,
     fp0_s_ahb_resp;
output spi0_mosi, spi0_sck, spi0_ssn, fp0_m_ahb_ready, fp0_m_ahb_resp,
     fp0_s_ahb_mastlock, fp0_s_ahb_sel, fp0_s_ahb_write;
input  [31:0] gpio_0_in_i;
input  [3:0] fp0_m_ahb_prot;
input  [2:0] fp0_m_ahb_size;
input  [31:0] fp0_m_ahb_addr;
input  [2:0] fp0_m_ahb_burst;
input  [1:0] fp0_m_ahb_trans;
input  [31:0] fp0_m_ahb_wdata;
input  [31:0] fp0_s_ahb_rdata;
output [31:0] gpio_0_out_o;
output [31:0] gpio_0_oe_o;
output [31:0] fp0_m_ahb_rdata;
output [3:0] fp0_s_ahb_prot;
output [2:0] fp0_s_ahb_size;
output [31:0] fp0_s_ahb_addr;
output [2:0] fp0_s_ahb_burst;
output [1:0] fp0_s_ahb_trans;
output [31:0] fp0_s_ahb_wdata;
wire dll_clkout0;

endmodule

(*
  agate_file_name = "/cygdrive/g/大创/Scaler/Scaler_With_LCD/outputs/../src/colorbar_gen.v:1",
  agate_format    = "VLOG"
*)
module colorbar_gen(clk, rstn, h_valid, v_valid);
input clk, rstn;
output h_valid, v_valid;
reg [10:0] h_cnt;
reg [9:0] v_cnt;
reg h_valid, v_valid;
wire i_fval, i_lval, N80, __dbP51, N81, __dbP63, __dbP86, __dbP98, __dbP109,
     __dbP120, n47, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n71,
     n82, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n105, n117, n129,
     n140, n142, n196, n197, n198, n199, n200, n201, n202, n203, n204, n205,
     n206, n207, n208, n209, n210, n211, n212, n213, n214, n215, n216, n217,
     n218, n219, n220, n221, n222, n223, n224, n225, n226, n277, n278, n279,
     n280, n281, n282, n283, n284, n285, n286, n287, n288, n289, n290, n291,
     n292, n293, n294, n295, n296, n297, n298, n299;

endmodule

(*
  agate_file_name = "/cygdrive/g/大创/Scaler/Scaler_With_LCD/outputs/../src/ahb_master.v:1",
  agate_format    = "VLOG"
*)
module ahb_master(hclk_i, hreset_n, hready_i, hresp_i, hrdata_i, haddr_o,
     htrans_o, hwrite_o, hsize_o, hburst_o, hwdata_o, dma_start_xfer, dma_addr,
     dma_rd_wrn, dma_burst_count, dma_fixed_burst, dma_wdata, dma_eof,
     ahm_rdata, ahm_rdata_push, ahm_wdata_pop, ahm_xfer_done, ahm_error);
input hclk_i, hreset_n, hready_i, hresp_i, dma_start_xfer, dma_rd_wrn,
     dma_fixed_burst, dma_eof;
output hwrite_o, ahm_rdata_push, ahm_wdata_pop, ahm_xfer_done, ahm_error;
input  [31:0] hrdata_i;
input  [31:0] dma_addr;
input  [7:0] dma_burst_count;
input  [31:0] dma_wdata;
output [31:0] haddr_o;
output [1:0] htrans_o;
output [2:0] hsize_o;
output [2:0] hburst_o;
output [31:0] hwdata_o;
output [31:0] ahm_rdata;
reg [2:0] hburst_o;
reg [1:0] htrans_o;
reg [31:0] hwdata_o;
reg [7:0] addr_count;
reg [2:0] ahb_cs;
reg [31:0] ahm_rdata_r;
reg [1:0] dma_cs;
reg [21:0] haddr_hi;
reg [7:0] haddr_lo;
reg [31:2] mx_addr;
reg [31:0] wdata_in_r;
reg [7:0] xfer_count;
wire [2:0] ahb_ns;
wire [7:0] beat_size;
wire [7:0] burst_size;
wire [1:0] dma_ns;
wire [7:0] lessbrstsize;
wire [31:0] rdata_in;
wire [31:0] wdata_in;
wire [31:0] wdata_out;
wire [7:0] xfer_count_temp;
reg ahm_error, ahm_rdata_push, ahm_xfer_done, hwrite_o, dma_eof_get, mx_done_r,
     prefetch_wdata_pop, wdata_pop, wdata_sel;
wire hready_del, incr_mx_addr, load_mx_addr, mx_done, mx_start, premature_end,
     rdata_get, resp_ok, tnf_finish, wdata_ahm_get, wdata_d1_get, N82, N83, N84,
     __dbP345, __dbP394, __dbP403, __dbP412, __dbP421, __dbP430, __dbP439, N85,
     N86, N87, N88, N89, N90, N91, __dbP604, N92, N93, N94, N95, N96, n6, n20,
     n21, n30, n38, n39, n40, n46, n49, n50, n53, n64, n65, n66, n70, n71, n73,
     n74, n77, n79, n80, n81, n83, n115, n116, n128, n129, n150, n151, n152,
     n166, n167, n168, n193, n194, n195, n196, n197, n198, n206, n207, n211,
     n212, n217, n222, n223, n227, n228, n231, n232, n233, n234, n235, n236,
     n237, n238, n239, n240, n241, n242, n243, n244, n245, n246, n247, n273,
     n274, n275, n276, n277, n278, n279, n280, n281, n290, n291, n308, n309,
     n310, n311, n312, n313, n314, n315, n316, n325, n326, n343, n344, n345,
     n346, n347, n348, n349, n350, n351, n360, n361, n378, n379, n380, n381,
     n382, n383, n384, n385, n403, n404, n405, n446, n447, n448, n449, n458,
     n459, n501, n502, n503, n504, n505, n506, n507, n508, n517, n518, n519,
     n520, n521, n522, n523, n524, n532, n544, n545, n546, n547, n548, n549,
     n550, n551, n575, n576, n578, n579, n580, n581, n582, n583, n584, n585,
     n586, n587, n588, n589, n590, n591, n592, n593, n594, n595, n596, n597,
     n598, n599, n645, n646, n650, n654, n655, n659, n660, n661, n667, n677,
     n678, n679, n686, n687, n696, n703, n740, n741, n742, n750, n754, n755,
     n756, n761, n762, n763, n768, n772, n773, n774, n775, n780, n781, n785,
     n789, n790, n794, n795, n796, n797, n804, n805, n806, n810, n818, n822,
     n826, n827, n828, n829, n836, n839, n845, n846, n880, n890, n891, n892,
     n896, n897, n898, n902, n903, n904, n974, n1043, n1044, n1048, n1049,
     n1050, n1052, n1061, n1062, n1063, n1064, n1067, n1068, n1071, n1072,
     n1091, n1104, n1105, n1106, n1110, n1111, n1112, n1113, n1114, n1115,
     n1119, n1120, n1121, n1122, n1123, n1124, n1128, n1129, n1130, n1131,
     n1132, n1133, n1134, n1135, n1136, n1140, n1141, n1142, n1146, n1147,
     n1148, n1184, n1185, n1186, n1187, n1188, n1189, n1190, n1191, n1192,
     n1193, n1194, n1195, n1196, n1197, n1198, n1199, n1200, n1201, n1202,
     n1203, n1204, n1205, n1206, n1207, n1208, n1209, n1210, n1211, n1212,
     n1213, n1214, n1215, n1232, n1249, n1250, n1251, n1252, n1253, n1254,
     n1255, n1256, n1257, n1258, n1259, n1260, n1261, n1262, n1263, n1264,
     n1265, n1266, n1267, n1268, n1269, n1270, n1271, n1272, n1319, n1320,
     n1321, n1322, n1323, n1324, n1325, n1326, n1327, n1328, n1329, n1330,
     n1331, n1332, n1333, n1334, n1335, n1336, n1337, n1338, n1339, n1340,
     n1341, n1342, n1343, n1344, n1345, n1346, n1347, n1348, n1349, n1350,
     n1351, n1352, n1353, n1354, n1355, n1356, n1357, n1358, n1359, n1360,
     n1361, n1362, n1363, n1364, n1365, n1366, n1367, n1368, n1369, n1370,
     n1371, n1372, n1373, n1374, n1375, n1376, n1377, n1378, n1417, n1418,
     n1419, n1420, n1421, n1422, n1423, n1424, n1425, n1426, n1427, n1428,
     n1429, n1430, n1431, n1432, n1444, n1454, n1455, n1456, n1457, n1458,
     n1459, n1460, n1461, n1462, n1463, n1464, n1465, n1466, n1467, n1468,
     n1469, n1500, n1501, n1502, n1503, n1504, n1505, n1506, n1507, n1508,
     n1509, n1510, n1511, n1512, n1513, n1514, n1515, n1516, n1517, n1518,
     n1519, n1520, n1521, n1522, n1523, n1524, n1525, n1526, n1527, n1528,
     n1529, n1530, n1531, n1532, n1533, n1534, n1535, n1536, n1537, n1538,
     n1539, n1540, n1541, n1542, n1543, n1567, n1571, n1577, n1582, n1583,
     n1584, n1593, n1603, n1608, n1609, n1610, n1611, n1612, n1613, n1614,
     n1615, n1616, n1617, n1618, n1619, n1624, n1627, n1635, n1638, n1646,
     n1649, n1657, n1696, n1697, n1698, n1699, n1700, n1701, n1702, n1703,
     n1704, n1705, n1706, n1707, n1708, n1709, n1710, n1711, n1712, n1713,
     n1714, n1715, n1716, n1717, n1718, n1719, n1720, n1721, n1722, n1723,
     n1724, n1725, n1726, n1727, n1792, n1793, n1794, n1795, n1796, n1797,
     n1798, n1799, n1800, n1801, n1802, n1803, n1804, n1805, n1806, n1807,
     n1808, n1809, n1810, n1811, n1812, n1813, n1814, n1815, n1816, n1817,
     n1818, n1819, n1820, n1821, n1822, n1823, n1888, n1889, n1890, n1891,
     n1892, n1893, n1894, n1895, n1896, n1897, n1898, n1899, n1900, n1901,
     n1902, n1903, n1904, n1905, n1906, n1907, n1908, n1909, n1910, n1911,
     n1912, n1913, n1914, n1915, n1916, n1917, n1918, n1919, n1952, n1953,
     n1954, n1955, n1956, n1957, n1958, n1959, n1960, n1961, n1962, n1963,
     n2475, n2478, n2479, n2480, n2481, n2482, n2483, n2484, n2485, n2486,
     n2487, n2488, n2489, n2490, n2491, n2492, n2493, n2494, n2495, n2496,
     n2497, n2498, n2499, n2500, n2501, n2502, n2503, n2504, n2505, n2506,
     n2507, n2508, n2509, n2510, n2511, n2512, n2513, n2514, n2515, n2516,
     n2517, n2518, n2519, n2520, n2521, n2522, n2523, n2524, n2525, n2526,
     n2527, n2528, n2529, n2530, n2531, n2532, n2533, n2534, n2535, n2536,
     n2537, n2538, n2539, n2540, n2541, n2542, n2543, n2544, n2545, n2546,
     n2547, n2548, n2549, n2550, n2551, n2552, n2553, n2554, n2555, n2556,
     n2557, n2558, n2559, n2560, n2561, n2562, n2563, n2564, n2565, n2566,
     n2567, n2568, n2569, n2570, n2571, n2572, n2573, n2574, n2575, n2576,
     n2577, n2578, n2579, n2580, n2581, n2582, n2583, n2584, n2585, n2586,
     n2587, n2588, n2589, n2590, n2591, n2592, n2593, n2594, n2595, n2596,
     n2597, n2598, n2599, n2600, n2601, n2602, n2603, n2604, n2605, n2606,
     n2607, n2608, n2609, n2610, n2611, n2612, n2613, n2614, n2615, n2616,
     n2617, n2618, n2619, n2620, n2621, n2622, n2623, n2624, n2625, n2626,
     n2627, n2628, n2629, n2630, n2631, n2632, n2633, n2634, n2635, n2636,
     n2637, n2638, n2639, n2640, n2641, n2642, n2643, n2644, n2645, n2646,
     n2647, n2648, n2649, n2650, n2651, n2652, n2653, n2654, n2655, n2656,
     n2657, n2658, n2659, n2660, n2661, n2662, n2663, n2664, n2665, n2666,
     n2667, n2668, n2669, n2670, n2671, n2672;

endmodule

(*
  agate_file_name = "/cygdrive/F/capital_micro/primace7.3/ast_frontend//../data/lib/syn_black_box_m7s.v:263",
  agate_format    = "VLOG"
*)
module M7S_EMB5K(clka, clkb, rstna, rstnb, cea, ceb, wea, web, aa, ab, da, db,
     q);
input clka, clkb, rstna, rstnb, cea, ceb, wea, web;
input  [11:0] aa;
input  [11:0] ab;
input  [17:0] da;
input  [17:0] db;
output [17:0] q;

endmodule

(*
  agate_file_name = "/cygdrive/g/大创/Scaler/Scaler_With_LCD/outputs/../src/emb_v1.v:15",
  agate_format    = "VLOG"
*)
module emb_v1_1(clkw, cew, aw, dw, clkr, cer, ar, qr);
input clkw, cew, clkr, cer;
input  [8:0] aw;
input  [31:0] dw;
input  [9:0] ar;
output [15:0] qr;
wire [17:0] qr0;
wire [17:0] qr1;
wire [17:0] qr2;
wire [17:0] qr3;

endmodule

(*
  agate_file_name = "/cygdrive/g/大创/Scaler/Scaler_With_LCD/outputs/../src/emb_v1.v:15",
  agate_format    = "VLOG"
*)
module emb_v1_2(clkw, cew, aw, dw, clkr, cer, ar, qr);
input clkw, cew, clkr, cer;
input  [8:0] aw;
input  [31:0] dw;
input  [9:0] ar;
output [15:0] qr;
wire [17:0] qr0;
wire [17:0] qr1;
wire [17:0] qr2;
wire [17:0] qr3;

endmodule

(*
  agate_file_name = "/cygdrive/g/大创/Scaler/Scaler_With_LCD/outputs/../src/sdram_to_RGB.v:1",
  agate_format    = "VLOG"
*)
module sdram_to_RGB(clk_ahb, rst_ahb_n, m_ahb_mastlock, m_ahb_prot, m_ahb_size,
     m_ahb_addr, m_ahb_write, m_ahb_burst, m_ahb_trans, m_ahb_wdata,
     m_ahb_ready, m_ahb_resp, m_ahb_rdata, display_sel, gpio_out, tx_sclk,
     h_valid, v_valid, de_o, pixel_r, pixel_g, pixel_b);
input clk_ahb, rst_ahb_n, m_ahb_ready, m_ahb_resp, display_sel, tx_sclk,
     h_valid, v_valid;
output m_ahb_mastlock, m_ahb_write, de_o;
input  [31:0] m_ahb_rdata;
input  [31:0] gpio_out;
output [3:0] m_ahb_prot;
output [2:0] m_ahb_size;
output [31:0] m_ahb_addr;
output [2:0] m_ahb_burst;
output [1:0] m_ahb_trans;
output [31:0] m_ahb_wdata;
output [7:0] pixel_r;
output [7:0] pixel_g;
output [7:0] pixel_b;
reg [10:0] addr_cnt;
reg [31:0] ahm_rdata_r;
reg [1:0] bmp_fig_chg;
reg [3:0] bmp_fig_cnt;
reg [1:0] buffer_rd_sel_r;
reg [1:0] de_i_r;
reg [3:0] de_i_r_sclk;
reg [31:0] dma_addr;
reg [9:0] emb_addr_rd;
reg [8:0] emb_addr_wr;
reg [8:0] emb_addr_wr_r;
reg [15:0] emb_rdata_0_r;
reg [15:0] emb_rdata_1_r;
reg [15:0] emb_rdata_r;
reg [1:0] v_valid_r;
wire [31:0] ahm_rdata;
wire [15:0] emb_rdata_0;
wire [15:0] emb_rdata_1;
reg de_o, ahm_rdata_push_wr0, ahm_rdata_push_wr1, buffer_rd_sel, buffer_wr_sel,
     de_i_start_pulse, display_before_bmp, display_period_align, dma_start_xfer,
     dma_start_xfer_prev, other_1_beat_start_pulse, other_1_beat_valid;
wire ahm_rdata_push, ahm_xfer_done, de_i, N104, N105, N106, N107, n50, n120,
     n156, n222, n223, n261, n294, n295, n296, n297, n298, n299, n300, n301,
     n302, n303, n304, n305, n306, n307, n308, n309, n310, n311, n312, n313,
     n314, n315, n316, n317, n318, n319, n320, n321, n322, n323, n324, n325,
     n397, n496, n530, n531, n588, n653, n654, n655, n656, n657, n658, n659,
     n660, n661, n662, n663, n664, n665, n666, n667, n668, n669, n670, n671,
     n672, n673, n674, n675, n676, n677, n678, n679, n680, n681, n682, n683,
     n684, n857, n923, n924, n925, n926, n927, n928, n929, n930, n931, n932,
     n933, n934, n935, n936, n937, n938, n939, n940, n941, n942, n943, n944,
     n945, n946, n947, n948, n949, n950, n951, n952, n953, n954, n1021, n1022,
     n1023, n1057, n1058, n1092, n1093, n1094, n1167, n1168, n1234, n1235,
     n1236, n1237, n1238, n1239, n1240, n1241, n1242, n1243, n1244, n1245,
     n1246, n1247, n1248, n1249, n1250, n1251, n1252, n1253, n1254, n1255,
     n1256, n1257, n1258, n1259, n1260, n1261, n1262, n1263, n1264, n1265,
     n1470, n1473, n1486, n1495, n1496, n1497, n1498, n1514, n1517, n1541,
     n1575, n1576, n1577, n1578, n1579, n1580, n1581, n1582, n1583, n1584,
     n1585, n1586, n1587, n1588, n1589, n1590, n1591, n1592, n1593, n1594,
     n1595, n1596, n1640, n1641, n1642, n1643, n1644, n1645, n1646, n1647,
     n1648, n1649, n1656, n1657, n1658, n1659, n1660, n1661, n1662, n1663,
     n1664, n1665, n1666, n1667, n1668, n1669, n1670, n1671, n1705, n1716,
     n1717, n1718, n1719, n1720, n1721, n1722, n1723, n1724, n1829, n1841,
     n1842, n1843, n1844, n1845, n1846, n1847, n1848, n1849, n1850, n1945,
     n1946, n1947, n1948, n1949, n1950, n1951, n1952, n1953, n1954, n1955,
     n1956, n1957, n1958, n1959, n1960, n2405, n2406, n2407, n2408, n2409,
     n2410, n2411, n2412, n2413, n2414, n2415, n2416, n2417, n2418, n2419,
     n2420, n2421, n2422, n2423, n2424, n2425, n2426, n2427, n2428, n2429,
     n2430, n2431, n2432, n2433, n2434, n2435, n2436, n2437, n2438, n2439,
     n2440, n2441, n2442, n2443, n2444, n2445, n2446, n2447, n2448, n2449,
     n2450, n2451, n2452, n2453, n2454, n2455, n2456, n2457, n2458, n2459,
     n2460, n2461, n2462, n2463, n2464, n2465, n2466, n2467, n2468, n2469,
     n2470, n2471, n2472, n2473, n2474, n2475, n2476, n2477, n2478, n2479,
     n2480, n2481, n2482, n2483, n2484, n2485, n2486, n2487, n2488, n2489,
     n2490, n2491, n2492, n2493, n2494, n2495, n2496, n2497, n2498, n2499,
     n2500, n2501, n2502, n2503, n2504, n2505, n2506, n2507, n2508, n2509,
     n2510, n2511, n2512, n2513, n2514, n2515, n2516, n2517, n2518, n2519,
     n2520, n2521, n2522, n2523, n2524, n2525, n2526, n2527, n2528, n2529,
     n2530, n2531, n2532, n2533, n2534, n2535, n2536, n2537, n2538, n2539,
     n2540, n2541, n2542, n2543, n2544, n2545, n2546, n2547, n2548, n2549,
     n2550, n2551, n2552, n2553, n2554, n2555, n2556, n2557, n2558, n2559,
     n2560, n2561, n2562, n2563, n2564, n2565, n2566, n2567, n2568, n2569,
     n2570, n2571, n2572, n2573, n2574, n2575, n2576, n2577, n2578, n2579,
     n2580, n2581, n2582, n2583, n2584, n2585, n2586, n2587, n2588, n2589,
     n2590, n2591, n2592, n2593;
    ahb_master u_ahb_master (.hclk_i(clk_ahb), .hreset_n(rst_ahb_n), .hready_i(m_ahb_ready),
        .hresp_i(m_ahb_resp), .hrdata_i({m_ahb_rdata[31:0]}), .haddr_o({m_ahb_addr[31:0]}),
        .htrans_o({m_ahb_trans[1:0]}), .hwrite_o(m_ahb_write), .hsize_o({m_ahb_size[2:0]}),
        .hburst_o({m_ahb_burst[2:0]}), .hwdata_o({m_ahb_wdata[31:0]}), .dma_start_xfer(dma_start_xfer),
        .dma_addr({dma_addr[31:1], 1'b0}), .dma_rd_wrn(), .dma_burst_count({1'b1,
        1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1}), .dma_fixed_burst(),
        .dma_eof(), .ahm_rdata({ahm_rdata[31:0]}), .ahm_rdata_push(ahm_rdata_push),
        .ahm_xfer_done(ahm_xfer_done));
    emb_v1_1 u_1kx16_0 (.clkw(clk_ahb), .cew(ahm_rdata_push_wr0), .aw({emb_addr_wr_r[8:0]}),
        .dw({ahm_rdata_r[31:0]}), .clkr(tx_sclk), .cer(n1092), .ar({emb_addr_rd[9:0]}),
        .qr({emb_rdata_0[15:0]}));
    emb_v1_2 u_1kx16_1 (.clkw(clk_ahb), .cew(ahm_rdata_push_wr1), .aw({emb_addr_wr_r[8:0]}),
        .dw({ahm_rdata_r[31:0]}), .clkr(tx_sclk), .cer(n1094), .ar({emb_addr_rd[9:0]}),
        .qr({emb_rdata_1[15:0]}));

endmodule

(*
  agate_file_name = "/cygdrive/F/capital_micro/primace7.3/ast_frontend//../data/lib/syn_black_box_m7s.v:781",
  agate_format    = "VLOG"
*)
module M7S_IO_LVDS(id_1, id_0, id_q_1, id_q_0, align_rstn, alignwd, clk_en_1,
     clk_en_0, io_reg_clk, geclk, geclk270, geclk180, geclk90, od_d_1, od_d_0,
     oen_1, oen_0, clk_0, clk_1, rstn_0, rstn_1, setn_0, setn_1, PAD1, PAD0);
input align_rstn, alignwd, clk_en_1, clk_en_0, geclk, geclk270, geclk180,
     geclk90, oen_1, oen_0, clk_0, clk_1, rstn_0, rstn_1, setn_0, setn_1;
inout PAD1, PAD0;
output id_1, id_0, io_reg_clk;
input  [3:0] od_d_1;
input  [3:0] od_d_0;
output [3:0] id_q_1;
output [3:0] id_q_0;

endmodule

(*
  agate_file_name = "/cygdrive/g/大创/Scaler/Scaler_With_LCD/outputs/../src/lvds_tx_v1.v:15",
  agate_format    = "VLOG"
*)
module lvds_tx_v1(clk, rstn, clk_out_p, clk_out_n, tx_out_p, tx_out_n, tx_sclk,
     tx_out, tx_data_align_rstn);
input clk, rstn, tx_data_align_rstn;
output clk_out_p, clk_out_n, tx_sclk;
input  [27:0] tx_out;
output [3:0] tx_out_p;
output [3:0] tx_out_n;
wire pll_clkout1;

endmodule

(*
  agate_file_name = "/cygdrive/g/大创/Scaler/Scaler_With_LCD/outputs/../src/demo_sd_to_lcd.v:3",
  agate_format    = "VLOG"
*)
module demo_sd_to_lcd(clk_i, rstn_i, display_sel, spi_ssn, spi_sck, spi_mosi,
     spi_miso, clk_out_p, clk_out_n, tx_out_p, tx_out_n);
input clk_i, rstn_i, display_sel, spi_miso;
output spi_ssn, spi_sck, spi_mosi, clk_out_p, clk_out_n;
output [3:0] tx_out_p;
output [3:0] tx_out_n;
wire [31:0] gpio_out;
wire [31:0] m_ahb_addr;
wire [2:0] m_ahb_burst;
wire [3:0] m_ahb_prot;
wire [31:0] m_ahb_rdata;
wire [2:0] m_ahb_size;
wire [1:0] m_ahb_trans;
wire [31:0] m_ahb_wdata;
wire [7:0] pixel_b;
wire [7:0] pixel_g;
wire [7:0] pixel_r;
wire [27:0] tx_out;
wire [6:0] tx_out_0;
wire [6:0] tx_out_1;
wire [6:0] tx_out_2;
wire [6:0] tx_out_3;
reg rstn_final;
wire clk_150M, clk_200M, de, h_valid, locked, m_ahb_mastlock, m_ahb_ready,
     m_ahb_resp, m_ahb_write, rstn_final_tmp, tx_sclk, v_valid, n4, n129, n370;
    pll_v1 u_pll (.clkin0(clk_i), .clkout0(clk_200M), .clkout1(clk_150M),
        .locked(locked));
    mcu_armcm3 u_arm (.fp2soc_rst_n(rstn_final), .fp_clk_sys(clk_200M), .fp_clk_arm(clk_200M),
        .fp_clk_ddrc(clk_200M), .gpio_0_out_o({gpio_out[31:0]}), .spi0_mosi(spi_mosi),
        .spi0_sck(spi_sck), .spi0_ssn(spi_ssn), .spi0_miso(spi_miso), .clk_ahb_fp0(clk_150M),
        .rst_ahb_fp0_n(rstn_final), .fp0_m_ahb_mastlock(m_ahb_mastlock),
        .fp0_m_ahb_prot({m_ahb_prot[3:0]}), .fp0_m_ahb_size({m_ahb_size[2:0]}),
        .fp0_m_ahb_addr({m_ahb_addr[31:0]}), .fp0_m_ahb_write(m_ahb_write),
        .fp0_m_ahb_burst({m_ahb_burst[2:0]}), .fp0_m_ahb_trans({m_ahb_trans[1:0]}),
        .fp0_m_ahb_wdata({m_ahb_wdata[31:0]}), .fp0_m_ahb_ready(m_ahb_ready),
        .fp0_m_ahb_resp(m_ahb_resp), .fp0_m_ahb_rdata({m_ahb_rdata[31:0]}));
    colorbar_gen u_colorgen (.clk(tx_sclk), .rstn(rstn_final), .h_valid(h_valid),
        .v_valid(v_valid));
    sdram_to_RGB u_sdram_to_RGB (.clk_ahb(clk_150M), .rst_ahb_n(rstn_final),
        .m_ahb_mastlock(m_ahb_mastlock), .m_ahb_prot({m_ahb_prot[3:0]}),
        .m_ahb_size({m_ahb_size[2:0]}), .m_ahb_addr({m_ahb_addr[31:0]}),
        .m_ahb_write(m_ahb_write), .m_ahb_burst({m_ahb_burst[2:0]}), .m_ahb_trans({m_ahb_trans[1:0]}),
        .m_ahb_wdata({m_ahb_wdata[31:0]}), .m_ahb_ready(m_ahb_ready), .m_ahb_resp(m_ahb_resp),
        .m_ahb_rdata({m_ahb_rdata[31:0]}), .display_sel(display_sel), .gpio_out({gpio_out[31:0]}),
        .tx_sclk(tx_sclk), .h_valid(h_valid), .v_valid(v_valid), .de_o(de),
        .pixel_r({pixel_r[7:0]}), .pixel_g({pixel_g[7:0]}), .pixel_b({pixel_b[7:0]}));
    lvds_tx_v1 u_lvds (.clk(clk_i), .rstn(rstn_final), .clk_out_p(clk_out_p),
        .clk_out_n(clk_out_n), .tx_out_p({tx_out_p[3:0]}), .tx_out_n({tx_out_n[3:0]}),
        .tx_sclk(tx_sclk), .tx_out({tx_out[27:0]}), .tx_data_align_rstn(rstn_final));

endmodule

