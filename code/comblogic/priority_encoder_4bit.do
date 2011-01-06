vsim pe4

#source procs.do

set s [list 0000 0001 0000 0011 0111 0101 1011 1101 0000 1110 1111 1010 0000 1011 1000 1001 1100 0101 0100 0110 0111 1000 0000]

#add wave \
#{sim:/pe4/v } \
#{sim:/pe4/a } \
#{sim:/pe4/x }

add wave -noupdate -divider INPUTS
add wave -noupdate -format Literal /pe4/v
add wave -noupdate -divider {ADDRESS OUTPUT}
add wave -noupdate -format Literal /pe4/a
add wave -noupdate -divider OUTPUT
add wave -noupdate -format Logic /pe4/x
update

testseq $s sim:/pe4/v 100
