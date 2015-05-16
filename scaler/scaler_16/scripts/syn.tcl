#Primace Version: 7.3
encoding system utf-8
set is_gui_platform true
set reportprogress reportProgress.exe
set win_platform true
set syn_dir $env(AST_FRONTEND)
set output_dir .
set design_name scaler
set outfile $output_dir/scaler.asv
set bbox_lib syn_black_box_m7s.v
set syn_vlog_src_in [ list ../src/coefcal_v3.v ../src/divider_v2.v ../src/scaler1.0.v ../src/inputCtrl.v ../src/emb_16_2k.v ../src/ramFifo.v ../src/Cal_v1.v ]
set search_path { . ../src }
set extract_latch true
set fca_en false
set resource_expand_bits 6
set fcc_en true
set extract_ram true
set extract_mem_size 4
set keep_hierarchy_en 0
source "$env(AST_FRONTEND)/agate/syn_base.tcl"