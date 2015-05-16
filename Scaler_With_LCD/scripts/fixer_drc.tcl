##############################################################################
# PROJECT VARIABLES
##############################################################################
set design           demo_sd_to_lcd
set arch             griffin
set arch_ver         2.0
set speed_grade      -3
set pvt_factor       1.28486
puts "ANDARA: ###############################"
puts "ANDARA: # Starting step: fixer_drc "
puts "ANDARA: ###############################"
set step fixer_drc
set inSrcFile netlist/chip_fixer.v
set fixedCellFile scripts/fplan.fixed_cells.tcl
set dccPlcFile outputs/fixer_dcc_plc.csv
set dccShuntFile outputs/fixer_dcc_shunt.txt
source "$env(CSTOOLS)/scripts/cswitch/fixer_drc.tcl"
catch {exec reportProgress 16 40 3}
puts "ANDARA: ###############################"
puts "ANDARA: # Ending step: fixer_drc "
puts "ANDARA: ###############################"