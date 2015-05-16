##############################################################################
# PROJECT VARIABLES
##############################################################################
set design           demo_sd_to_lcd
set arch             griffin
set arch_ver         2.0
set speed_grade      -3
set pvt_factor       1.28486
puts "ANDARA: ###############################"
puts "ANDARA: # Starting step: fplan "
puts "ANDARA: ###############################"
set step fplan
set inFile outputs/demo_sd_to_lcd.amv
set outFile netlist/chip_fplan.v
set outDbFile db/chip_fplan.db
set outFplanFixedCellsFile scripts/fplan.fixed_cells.tcl
set outAocFile outputs/demo_sd_to_lcd_pr.aoc
set inAocFile demo_sd_to_lcd.aoc
source "$env(CSTOOLS)/scripts/cswitch/fplan.tcl"
catch {exec reportProgress 8 45 3}
puts "ANDARA: ###############################"
puts "ANDARA: # Ending step: fplan "
puts "ANDARA: ###############################"