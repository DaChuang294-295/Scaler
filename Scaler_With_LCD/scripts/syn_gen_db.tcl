##############################################################################
# PROJECT VARIABLES
##############################################################################
set design           demo_sd_to_lcd
set arch             griffin
set arch_ver         2.0
set speed_grade      -3
set pvt_factor       1.28486
puts "ANDARA: ###############################"
puts "ANDARA: # Starting step: syn_gen_db "
puts "ANDARA: ###############################"
set step syn_gen_db
set inSrcFile outputs/demo_sd_to_lcd.amv
set outDbFile db/chip_syn.db
catch {exec reportProgress 8 0 3}
source "$env(CSTOOLS)/scripts/cswitch/syn_gen_db.tcl"
catch {exec reportProgress 8 15 3}
puts "ANDARA: ###############################"
puts "ANDARA: # Ending step: syn_gen_db "
puts "ANDARA: ###############################"