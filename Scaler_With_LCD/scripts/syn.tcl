#Primace Version: 7.3
encoding system utf-8
set is_gui_platform true
set reportprogress reportProgress.exe
set win_platform true
set syn_dir $env(AST_FRONTEND)
set output_dir .
set design_name demo_sd_to_lcd
set outfile $output_dir/demo_sd_to_lcd.asv
set bbox_lib syn_black_box_m7s.v
set syn_vlog_src_in [ list ../src/ahb_master.v ../src/colorbar_gen.v ../src/demo_sd_to_lcd.v ../src/emb_v1.v ../src/lvds_tx_v1.v ../src/mcu_armcm3.v ../src/pll_v1.v ../src/sdram_to_RGB.v ../src/por_v1_1.v ../src/gbuf_v1_1.v ../src/Cal_v1.v ../src/coefcal_v3.v ../src/divider_v2.v ../src/emb_16_2k.v ../src/inputCtrl.v ../src/ramFifo.v ../src/scaler1.0.v ../src/scalerForM7.v ]
set search_path { . ../src }
set extract_latch true
set fca_en true
set resource_expand_bits 6
set fcc_en true
set extract_ram false
set extract_mem_size 3
set keep_hierarchy_en 0
source "$env(AST_FRONTEND)/agate/syn_base.tcl"