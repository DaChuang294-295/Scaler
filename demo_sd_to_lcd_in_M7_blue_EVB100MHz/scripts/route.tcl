##############################################################################
# PROJECT VARIABLES
##############################################################################
set design           demo_sd_to_lcd
set arch             griffin
set arch_ver         2.0
set speed_grade      -3
set pvt_factor       1.28486
puts "ANDARA: ###############################"
puts "ANDARA: # Starting step: route "
puts "ANDARA: ###############################"
set step route
set inDbFile       db/chip_pack.db
set inSdcFile      [list "constraint/myconstraint.sdc" "$env(CSTESTS)/lib/special.sdc" "$env(AGATE_ROOT)/bin/template/project/propagated_clock.sdc"]
set ntiming_paths  500
set routeLog       outputs/chip_rte.ro
set outDbFile      db/chip_rte.db
set outFile        netlist/chip_rte.v
set arafile        outputs/demo_sd_to_lcd.ara
set dev_name       M7A12N0F484C7
set outSdcFile     ""
set routeSdf       ""
set apafile        outputs/demo_sd_to_lcd.apa
set arvfile        outputs/demo_sd_to_lcd.arv
set andara_ver     5.1.2
set delayType      max
set rgraph         "$env(USE_RGRAPH_ARCH)"
set rgraph_delay   "$env(USE_RGRAPH_DELAY)"
source "$env(CSTOOLS)/scripts/cswitch/route.tcl"
catch {exec reportProgress 16 100 3}
puts "ANDARA: ###############################"
puts "ANDARA: # Ending step: route "
puts "ANDARA: ###############################"