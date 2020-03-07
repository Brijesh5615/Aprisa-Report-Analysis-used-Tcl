
#set a [gets stdin ]
set b [exec realpath report.txt]

puts "$b";



######################################################################################
########### DIE AREA#################################################################
set DIE "-"
set report_file [open  $b r]
set pattern {  die area                    }

while {[gets $report_file line] != -1} {
      if {[regexp $pattern $line]} {
      set DIE [lindex $line  3]
      break
    } else {
    continue
   }
 }
close $report_file


#######################################################################
############### CORE AREA ##############################################

set CORE "-"
set report_file [open  $b r]
set pattern {  core area                   }

while {[gets $report_file line] != -1} {
      if {[regexp $pattern $line]} {
      set CORE [lindex $line  3]
      break
    } else {
    continue
   }
 }
close $report_file

#######################################################################
############## DIE UTILIZATION #######################################

set DIE_UTI "-"
set report_file [open  $b r]
set pattern {  die utilization                          }

while {[gets $report_file line] != -1} {
      if {[regexp $pattern $line]} {
      set DIE_UTI [lindex $line  3]
      break
    } else {
    continue
   }
 }
close $report_file

#######################################################################
################## CORE UTILIZATION ################################

set CORE_UTI "-"
set report_file [open  $b r]
set pattern {  core utilization                         }

while {[gets $report_file line] != -1} {
      if {[regexp $pattern $line]} {
      set CORE_UTI [lindex $line  3]
      break
    } else {
    continue
   }
 }
close $report_file

#####################################################################
###### STD CELLS COUNT ##############################################

set STD_CELLS "-"
set report_file [open  $b r]
set pattern { std cells        }

while {[gets $report_file line] != -1} {
      if {[regexp $pattern $line]} {
      set STD_CELLS [lindex $line  4]
      break
    } else {
    continue
   }
 }
close $report_file

##################################################################
################ TOTAL GATE COUNT #################################
set TOTAL_CELLS "-"
set report_file [open  $b r]
set pattern {  total gate count   }

while {[gets $report_file line] != -1} {
      if {[regexp $pattern $line]} {
      set TOTAL_CELLS [lindex $line  4]
      break
    } else {
    continue
   }
 }
close $report_file

#####################################################################
#################### ANTENNA ######################################

set ANTENNA "-"
set report_file [open  $b r]
set pattern {                     antenna :}

while {[gets $report_file line] != -1} {
      if {[regexp $pattern $line]} {
      set ANTENNA [lindex $line  2]
      break
    } else {
    continue
   }
 }
close $report_file

#####################################################################
################## TOTAL VIOLATION #################################
set TOTAL_VIO "-"
set report_file [open  $b r]
set pattern {            Total violations :}

while {[gets $report_file line] != -1} {
      if {[regexp $pattern $line]} {
      set TOTAL_VIO [lindex $line  3]
      break
    } else {
    continue
   }
 }
close $report_file

###################################################################
############## MAX WORST NAGATIVE SLACK #########################

set MAX_WNS "-"
set report_file [open  $b r]
set pattern {Max                }

while {[gets $report_file line] != -1} {
      if {[regexp $pattern $line]} {
      set MAX_WNS [lindex $line  2]
      break
    } else {
    continue
   }
 }
close $report_file

###################################################################
############# MAX TOTAL NAGATIVE SLACK #########################
set MAX_TNS "-"
set report_file [open  $b r]
set pattern {Max                }

while {[gets $report_file line] != -1} {
      if {[regexp $pattern $line]} {
      set MAX_TNS [lindex $line  3]
      break
    } else {
    continue
   }
 }
close $report_file


###################################################################
#############  MIN WORST NAGATIVE SLACK ######################### 
set MIN_WNS "-"
set report_file [open  $b r]
set pattern {Min             }

while {[gets $report_file line] != -1} {
      if {[regexp $pattern $line]} {
      set MIN_WNS [lindex $line  2]
      break
    } else {
    continue
   }
 }
close $report_file


###################################################################
############## MIN TOTAL NAGATIVE SLACK #########################

set MIN_TNS "-"
set report_file [open  $b r]
set pattern {Min             }

while {[gets $report_file line] != -1} {
      if {[regexp $pattern $line]} {
      set MIN_TNS [lindex $line  3]
      break
    } else {
    continue
   }
 }
close $report_file



puts "                                         ****PRESENT BY BRIJESH PARAKHIYA (APRISA TOOLS)****                             "
set formatStr {%15s%15s%15s%15s%15s%15s%15s%15s%15s%15s%15s%15s}
puts [format $formatStr "---AREA----" "---AREA----" "Utilization" "Utilization" "-std cfells" "----TOTAL--" "-VIOLATION-" "---TOTAL---" "-----------" "-----------" "-----------" "-----------" ]
puts [format $formatStr "----DIE----" "---CORE----" "----DIE----" "---CORE----" "-----------" "---GATE----" "--ANTENNA--" "-VIOLATION-" "--MAX_WNS--" "--MAX_TNS--" "--MIN_WNS--" "--MIN_TNS--" ] 
puts [format $formatStr "-----------" "-----------" "-----------" "-----------" "-----------" "---COUNT---" "-----------" "-----------" "-----------" "-----------" "-----------" "-----------" ]
foreach die $DIE core $CORE die_uti $DIE_UTI core_uti $CORE_UTI std_cells $STD_CELLS total_cells $TOTAL_CELLS antenna $ANTENNA total_vio $TOTAL_VIO max_wns $MAX_WNS max_tns $MAX_TNS min_wns $MIN_WNS min_tns $MIN_TNS {
       puts [format $formatStr $die $core $die_uti $core_uti $std_cells $total_cells $antenna $total_vio $max_wns $max_tns $min_wns $min_tns ]
}
puts [format $formatStr "-----------" "-----------" "-----------" "-----------" "-----------" "-----------" "-----------" "-----------" "-----------" "-----------" "-----------" "-----------"]
puts "\n"


