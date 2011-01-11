onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group Lines -format Logic -label Data /seq/data
add wave -noupdate -expand -group Lines -format Logic -label Flag /seq/flag
add wave -noupdate -expand -group Lines -format Logic -label Clock /seq/clock
add wave -noupdate -expand -group Lines -format Logic -label Reset /seq/reset
add wave -noupdate -expand -group Internal -format Literal -label N /seq/states/n
add wave -noupdate -expand -group Internal -format Logic /seq/data_sig
add wave -noupdate -expand -group Internal -format Literal /seq/state_next
add wave -noupdate -expand -group Internal -format Literal /seq/state_reg
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
configure wave -namecolwidth 212
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
force -freeze sim:/seq/clock 1 0, 0 {50 ns} -r 100
force -freeze sim:/seq/reset 0 0
force -freeze sim:/seq/data 1 0
update
WaveRestoreZoom {0 ns} {900 ns}
