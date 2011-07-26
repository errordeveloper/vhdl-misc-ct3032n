transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {/home/110101/uni/ct3032n/vhdl/ast_2.git/code/comblogic/alu_4bit.vhd}

vcom -93 -work work {/home/110101/uni/ct3032n/vhdl/ast_2.git/code/projects/../comblogic/alu_4bit.vht}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L cycloneiv_hssi -L cycloneiv_pcie_hip -L cycloneiv -L rtl_work -L work -voptargs="+acc" ALU_tb

onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group Operands -format Literal -label A -radix decimal /alu_tb/a
add wave -noupdate -expand -group Operands -format Literal -label B -radix decimal /alu_tb/b
add wave -noupdate -format Literal -label Operator -radix hexadecimal /alu_tb/i
add wave -noupdate -format Literal -label Result -radix decimal /alu_tb/x
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
configure wave -namecolwidth 150
configure wave -valuecolwidth 38
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
update
WaveRestoreZoom {29982 ps} {377370 ps}

view structure
view signals
run -all
