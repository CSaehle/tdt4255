onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix decimal /tb_toplevel/clk
add wave -noupdate -radix decimal /tb_toplevel/reset
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/inst_register_file/regs
add wave -noupdate -radix decimal /tb_toplevel/command
add wave -noupdate -radix decimal /tb_toplevel/bus_address_in
add wave -noupdate -radix decimal /tb_toplevel/bus_data_in
add wave -noupdate -radix decimal /tb_toplevel/status
add wave -noupdate -radix decimal /tb_toplevel/bus_data_out
add wave -noupdate -radix decimal /tb_toplevel/reset
add wave -noupdate -radix decimal /tb_toplevel/command
add wave -noupdate -radix decimal /tb_toplevel/bus_address_in
add wave -noupdate -radix hexadecimal /tb_toplevel/bus_data_in
add wave -noupdate -radix decimal /tb_toplevel/status
add wave -noupdate -radix decimal /tb_toplevel/bus_data_out
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/inst_register_file/regs(1)
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/inst_register_file/regs(4)
add wave -noupdate -radix decimal /tb_toplevel/clk
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/processor_enable
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/imem_address
add wave -noupdate -radix hexadecimal /tb_toplevel/uut/mips_sc_processor/imem_data_in
add wave -noupdate -radix hexadecimal /tb_toplevel/uut/mips_sc_processor/dmem_data_in
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/dmem_address
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/dmem_address_wr
add wave -noupdate -radix hexadecimal /tb_toplevel/uut/mips_sc_processor/dmem_data_out
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/dmem_write_enable
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/current_state
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/next_state
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/reg_dst
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/alu_src
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/mem_to_reg
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/reg_write
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/mem_read
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/mem_write
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/branch
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/alu_op
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/jump
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/alu_x
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/alu_y
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/alu_in
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/alu_out
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/flags.zero
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/pc_current
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/offset
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/pc_next
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/rs
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/rt
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/rd_addr
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/data_to_write
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/pc_write_enable
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
configure wave -namecolwidth 310
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
configure wave -timelineunits ps
update
WaveRestoreZoom {999050 ps} {999669 ps}
