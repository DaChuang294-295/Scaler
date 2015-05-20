(*
  agate_file_name = "/cygdrive/g/大创/Scaler/Scaler_With_LCD/outputs/../src/inputCtrl.v:9",
  agate_format    = "VLOG"
*)
module inputCtrl(clk, rst, xBgn, xEnd, yBgn, yEnd, dInEn, dIn, En, kX, kY,
     ramWrtAddr, ramWrtEn, dataOut, jmp, inXRes, fifoNum, v_valid, h_valid);
input clk, rst, dInEn, En;
output ramWrtEn, jmp, v_valid, h_valid;
input  [9:0] xBgn;
input  [9:0] xEnd;
input  [9:0] yBgn;
input  [9:0] yEnd;
input  [23:0] dIn;
input  [7:0] kX;
input  [7:0] kY;
input  [9:0] inXRes;
input  [2:0] fifoNum;
output [10:0] ramWrtAddr;
output [23:0] dataOut;
reg [10:0] ramWrtAddr;
reg [9:0] xAddress;
reg [15:0] xCal;
reg [9:0] yAddress;
reg [15:0] yCal;
wire [7:0] xAdder;
wire [9:0] xNxtAddress;
wire [15:0] xNxtCal;
wire [7:0] yAdder;
wire [9:0] yNxtAddress;
wire [15:0] yNxtCal;
reg h_valid, jmp, ramWrtEn, v_valid, row_switch, xPreEn, yPreEn, N237, N239,
     N241, N243, N245, N247, N249, N251, N253, N255, N257, N259, N261, N263,
     N265, N267, N269, N271, N273, N275, N277, N279, N281, N283, N285, N287,
     N289, N291, N293, N295, N297, N299, N301, N303, N305, N307, N309, N311,
     N313, N315, N317, N319, N321, N323, N325, N327, N329, N331;
tri n573, n574, n575, n576, n577, n578, n579, n580, n581, n582, n583, n584,
     n585, n586, n587, n588, n589, n590, n591, n592, n593, n594, n595, n596,
     n1271, n1275, n1279, n1283, n1287, n1291, n1295, n1299, n1303, n1307,
     n1311, n1315, n1319, n1323, n1327, n1331, n1335, n1339, n1343, n1347,
     n1351, n1355, n1359, n1363;
wire boundEn, trueEn, xBgnEn, xEn, xEndEn, xThisEn, yBgnEn, yEn, yEndEn,
     yThisEn, N238, N240, N242, N244, N246, N248, N250, N252, N254, N256, N258,
     N260, N262, N264, N266, N268, N270, N272, N274, N276, N278, N280, N282,
     N284, N286, N288, N290, N292, N294, N296, N298, N300, N302, N304, N306,
     N308, N310, N312, N314, N316, N318, N320, N322, N324, N326, N328, N330,
     N332, __dbP2707, __dbP2724, N333, N334, N335, N336, __dbP2797, __dbP2800,
     __dbP2803, __dbP2806, N337, n19, n20, n45, n46, n137, n138, n139, n140,
     n141, n142, n143, n144, n145, n146, n147, n148, n149, n150, n151, n152,
     n153, n154, n155, n156, n157, n158, n201, n202, n203, n204, n205, n206,
     n207, n208, n209, n210, n211, n212, n213, n214, n215, n216, n217, n218,
     n219, n220, n221, n222, n223, n227, n231, n235, n239, n243, n282, n286,
     n287, n288, n289, n355, n389, n454, n455, n456, n457, n458, n524, n597,
     n599, n643, n644, n645, n646, n647, n648, n649, n650, n651, n652, n653,
     n654, n655, n656, n657, n658, n659, n660, n661, n662, n663, n664, n665,
     n666, n667, n668, n669, n670, n671, n672, n673, n674, n711, n800, n801,
     n802, n803, n804, n805, n806, n807, n808, n809, n810, n811, n812, n813,
     n814, n815, n816, n817, n818, n819, n820, n821, n822, n823, n824, n825,
     n826, n827, n828, n829, n830, n831, n832, n833, n834, n835, n836, n837,
     n838, n839, n840, n841, n842, n909, n998, n999, n1000, n1001, n1002, n1003,
     n1004, n1005, n1006, n1007, n1008, n1009, n1010, n1011, n1012, n1013,
     n1014, n1015, n1016, n1017, n1018, n1019, n1020, n1021, n1022, n1023,
     n1024, n1025, n1026, n1027, n1028, n1029, n1030, n1031, n1032, n1033,
     n1034, n1035, n1036, n1037, n1038, n1039, n1040, n1107, n1110, n1180,
     n1186, n1187, n1188, n1189, n1190, n1191, n1192, n1193, n1194, n1195,
     n1196, n1197, n1198, n1199, n1200, n1201, n1202, n1203, n1204, n1205,
     n1206, n1207, n1208, n1209, n1210, n1211, n1212, n1213, n1214, n1215,
     n1216, n1217, n1218, n1219, n1220, n1233, n1234, n1235, n1236, n1237,
     n1238, n1239, n1240, n1241, n1242, n1243, n1244, n1245, n1246, n1247,
     n1248, n1249, n1250, n1251, n1252, n1253, n1254, n1255, n1256, n1366,
     n1634, n1635, n1636, n1637, n1638, n1639, n1640, n1641, n1642, n1643,
     n1644, n1645, n1646, n1647, n1648, n1649, n1650, n1651, n1652, n1653,
     n1654, n1655, n1656, n1657, n1658, n1659, n1660, n1661, n1662, n1663,
     n1664, n1665, n1666, n1667, n1668, n1669, n1670, n1671, n1672, n1673,
     n1674, n1675, n1676, n1677, n1678, n1679, n1680, n1681, n1682, n1683,
     n1684, n1685, n1686, n1687, n1688, n1689, n1690, n1691, n1692, n1693,
     n1694, n1695, n1696, n1697, n1698, n1699, n1700, n1701, n1702, n1703,
     n1704, n1705, n1706, n1707, n1708, n1709, n1710, n1711, n1712, n1713,
     n1714, n1715, n1716, n1717, n1718, n1719, n1720, n1721, n1722, n1723,
     n1724, n1725, n1726, n1727, n1728, n1729, n1730, n1731, n1732, n1733,
     n1734, n1735, n1736, n1737, n1738, n1739, n1740, n1741, n1742, n1743,
     n1744, n1745, n1746, n1747, n1748, n1749, n1750, n1751, n1752;

endmodule

