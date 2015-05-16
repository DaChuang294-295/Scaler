##############################################################################
# PROJECT VARIABLES
##############################################################################
set design           demo_sd_to_lcd
set arch             griffin
set arch_ver         2.0
set speed_grade      -3
set pvt_factor       1.28486
puts "ANDARA: ###############################"
puts "ANDARA: # Starting step: refiner_new "
puts "ANDARA: ###############################"
set step refiner_new
set inFile netlist/chip_assigner.v
set outFile netlist/chip_refiner.v
set outDbFile db/chip_refiner.db
set sdcFile [list "constraint/myconstraint.sdc" "$env(CSTESTS)/lib/special.sdc" "$env(AGATE_ROOT)/bin/template/project/propagated_clock.sdc"]
set apafile outputs/demo_sd_to_lcd.apx
set andara_ver 5.1.2
set dev_name M7A12N0F484C7
set apvfile outputs/demo_sd_to_lcd.apv
set delayType max
set use_assigner 1
set refinerClockAdjust 200
source "$env(CSTOOLS)/scripts/cswitch/refiner_new.tcl"
catch {exec reportProgress 8 100 3}
puts "ANDARA: ###############################"
puts "ANDARA: # Ending step: refiner_new "
puts "ANDARA: ###############################"