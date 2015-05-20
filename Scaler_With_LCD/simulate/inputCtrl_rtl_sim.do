transcript on
if {[file exists rtl_work]} {
    vdel -lib rtl_work -all
}
vlib rtl_work
vmap -c work rtl_work
vlog -vlog01compat -work work F:/capital_micro/primace7.3/data/lib/m7s_sim.v
vlog -vlog01compat -work work F:/capital_micro/primace7.3/data/lib/M7S_SOC.v +incdir+F:/capital_micro/primace7.3/data/lib
vlog -vlog01compat -work work  "G:/大创/Scaler/Scaler_With_LCD/src/ahb_master.v" "G:/大创/Scaler/Scaler_With_LCD/src/colorbar_gen.v" "G:/大创/Scaler/Scaler_With_LCD/src/demo_sd_to_lcd.v" "G:/大创/Scaler/Scaler_With_LCD/src/emb_v1.v" "G:/大创/Scaler/Scaler_With_LCD/src/lvds_tx_v1.v" "G:/大创/Scaler/Scaler_With_LCD/src/mcu_armcm3.v" "G:/大创/Scaler/Scaler_With_LCD/src/pll_v1.v" "G:/大创/Scaler/Scaler_With_LCD/src/por_v1_1.v" "G:/大创/Scaler/Scaler_With_LCD/src/gbuf_v1_1.v" "G:/大创/Scaler/Scaler_With_LCD/src/Cal_v1.v" "G:/大创/Scaler/Scaler_With_LCD/src/coefcal_v3.v" "G:/大创/Scaler/Scaler_With_LCD/src/divider_v2.v" "G:/大创/Scaler/Scaler_With_LCD/src/emb_16_2k.v" "G:/大创/Scaler/Scaler_With_LCD/src/inputCtrl.v" "G:/大创/Scaler/Scaler_With_LCD/src/ramFifo.v" "G:/大创/Scaler/Scaler_With_LCD/src/scaler1.0.v" "G:/大创/Scaler/Scaler_With_LCD/src/scalerForM7.v" "G:/大创/Scaler/Scaler_With_LCD/src/sdram_to_RGB.v" "G:/大创/Scaler/Scaler_With_LCD/src/inputCtrlTB.v" +initreg+0
vsim -voptargs=+acc work.inputCtrlTB 
add wave -r /*