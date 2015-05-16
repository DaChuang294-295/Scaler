##############################################################################
# PROJECT VARIABLES
##############################################################################
set design           demo_sd_to_lcd
set arch             griffin
set arch_ver         2.0
set speed_grade      -3
set pvt_factor       1.28486
puts "ANDARA: ###############################"
puts "ANDARA: # Starting step: assigner_cstool "
puts "ANDARA: ###############################"
set step assigner_cstool
set use_fplan 1
set sdcFile [list "constraint/myconstraint.sdc" "$env(CSTESTS)/lib/special.sdc" "$env(AGATE_ROOT)/bin/template/project/propagated_clock.sdc"]
set use_new_flow 1
set max_dcc_latency_constraint -1
source "$env(CSTOOLS)/scripts/cswitch/assigner_cstool.tcl"
catch {exec reportProgress 8 70 3}
puts "ANDARA: ###############################"
puts "ANDARA: # Ending step: assigner_cstool "
puts "ANDARA: ###############################"