# this is very basic test procedure
proc testseq { seq sig t } {
    
    for {set c 0} {$c < [llength $seq]} {incr c} {
        
    force -freeze $sig [lindex $seq $c] 0;
    
    if { [expr $t == 0] } then { run; } else { run $t }

    }
    
}

# it is probably better to supply nested list such that
#
# {NUMBER_OF_SIGNALS_OR_ZERO {signal1 {LIST_OF_VALUES}
#                            {signal2 {LIST_OF_VALUES}
#                            { ..................... }
#			     {signalX {LIST_OF_VALUES} }
