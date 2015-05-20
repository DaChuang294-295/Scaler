## PROGRAM "Primace"
## VERSION "Version 7.3"
##
## Device: M7A12N0F484C7

set design demo_sd_to_lcd
set inFile "demo_sd_to_lcd.arv"
set inSdfFile "demo_sd_to_lcd.sdf"
set sdcFile [list "../constraint/myconstraint.sdc" "$env(AGATE_ROOT)/bin/template/project/propagated_clock.sdc"]
set modeFile ""
set report_file "demo_sd_to_lcd.trpt"
set lib_file "$env(AGATE_ROOT)/data/csta/data/M7S/M7S.lib"
set extlib_tcl_file "$env(AGATE_ROOT)/data/csta/scripts/M7S_extlib.tcl"
set max_path 10000000
source "$env(AGATE_ROOT)/bin/template/project/scripts/run_sta.tcl"