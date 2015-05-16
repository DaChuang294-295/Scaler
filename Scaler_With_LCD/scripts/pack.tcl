##############################################################################
# PROJECT VARIABLES
##############################################################################
set design           demo_sd_to_lcd
set arch             griffin
set arch_ver         2.0
set speed_grade      -3
set pvt_factor       1.28486
puts "ANDARA: ###############################"
puts "ANDARA: # Starting step: pack "
puts "ANDARA: ###############################"
set step pack
set inFile netlist/chip_fixer.v
set dbFile db/chip_fixer.db
set outFile netlist/chip_pack.v
set outDbFile db/chip_pack.db
source "$env(CSTOOLS)/scripts/cswitch/pack.tcl"
catch {exec reportProgress 16 70 3}
puts "ANDARA: ###############################"
puts "ANDARA: # Ending step: pack "
puts "ANDARA: ###############################"