##############################################################################
# PROJECT VARIABLES
##############################################################################
set design           demo_sd_to_lcd
set arch             griffin
set arch_ver         2.0
set speed_grade      -3
set pvt_factor       1.28486
puts "ANDARA: ###############################"
puts "ANDARA: # Starting step: fixer "
puts "ANDARA: ###############################"
set step fixer
set inFile netlist/chip_refiner.v
set outFile netlist/chip_fixer.v
set outDbFile db/chip_fixer.db
set sdcFile [list "constraint/myconstraint.sdc" "$env(CSTESTS)/lib/special.sdc" "$env(AGATE_ROOT)/bin/template/project/propagated_clock.sdc"]
set placerMode wire_timing
set numberPaths 500
set delayType max
set outSdcFile { }
set fixerClockAdjust 200
catch {exec reportProgress 16 0 3}
source "$env(CSTOOLS)/scripts/cswitch/fixer.tcl"
catch {exec reportProgress 16 20 3}
puts "ANDARA: ###############################"
puts "ANDARA: # Ending step: fixer "
puts "ANDARA: ###############################"