transcript on
if {[file exists rtl_work]} {
    vdel -lib rtl_work -all
}
vlib rtl_work
vmap -c work rtl_work
vlog -vlog01compat -work work F:/capital_micro/primace7.3/data/lib/m7s_sim.v
# vlog -vlog01compat -work work F:/capital_micro/primace7.3/data/lib/M7S_SOC.v +incdir+F:/capital_micro/primace7.3/data/lib
vlog -vlog01compat -work work  "F:/capital_micro/primace7.3/bin/dachuang/final_scaler_v3_test/src/coefcal_v3.v" "F:/capital_micro/primace7.3/bin/dachuang/final_scaler_v3_test/src/scaler1.0.v" "F:/capital_micro/primace7.3/bin/dachuang/final_scaler_v3_test/src/inputCtrl.v" "F:/capital_micro/primace7.3/bin/dachuang/final_scaler_v3_test/src/ramFifo.v" "F:/capital_micro/primace7.3/bin/dachuang/final_scaler_v3_test/src/emb_12_2k.v" "F:/capital_micro/primace7.3/bin/dachuang/final_scaler_v3_test/src/divider_v2.v" "F:/capital_micro/primace7.3/bin/dachuang/final_scaler_v3_test/src/Cal_v1.v" "F:/capital_micro/primace7.3/bin/dachuang/final_scaler_v3_test/src/ramFifo_tb.v" "F:/capital_micro/primace7.3/bin/dachuang/final_scaler_v3_test/src/scaler_tb.v" "F:/capital_micro/primace7.3/bin/dachuang/final_scaler_v3_test/src/scaler_tb2.v" "F:/capital_micro/primace7.3/bin/dachuang/final_scaler_v3_test/src/Cal_tb.v" +initreg+0
vsim -voptargs=+acc work.tb 
add wave -r /*