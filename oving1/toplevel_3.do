onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /tb_toplevel/clk
add wave -noupdate -radix hexadecimal /tb_toplevel/reset
add wave -noupdate -radix hexadecimal /tb_toplevel/command
add wave -noupdate -radix hexadecimal /tb_toplevel/bus_address_in
add wave -noupdate -radix hexadecimal /tb_toplevel/bus_data_in
add wave -noupdate -radix hexadecimal /tb_toplevel/status
add wave -noupdate -radix hexadecimal /tb_toplevel/bus_data_out
add wave -noupdate -radix hexadecimal /tb_toplevel/uut/data_mem/mem(1)
add wave -noupdate -radix hexadecimal /tb_toplevel/uut/mips_sc_processor/inst_register_file/rs
add wave -noupdate -radix hexadecimal /tb_toplevel/uut/mips_sc_processor/inst_register_file/rt
add wave -noupdate -radix hexadecimal /tb_toplevel/uut/mips_sc_processor/inst_register_file/regs
add wave -noupdate -radix hexadecimal -expand -subitemconfig {/tb_toplevel/uut/mips_sc_processor/inst_register_file/regs(1)(31) {-radix hexadecimal} /tb_toplevel/uut/mips_sc_processor/inst_register_file/regs(1)(30) {-radix hexadecimal} /tb_toplevel/uut/mips_sc_processor/inst_register_file/regs(1)(29) {-radix hexadecimal} /tb_toplevel/uut/mips_sc_processor/inst_register_file/regs(1)(28) {-radix hexadecimal} /tb_toplevel/uut/mips_sc_processor/inst_register_file/regs(1)(27) {-radix hexadecimal} /tb_toplevel/uut/mips_sc_processor/inst_register_file/regs(1)(26) {-radix hexadecimal} /tb_toplevel/uut/mips_sc_processor/inst_register_file/regs(1)(25) {-radix hexadecimal} /tb_toplevel/uut/mips_sc_processor/inst_register_file/regs(1)(24) {-radix hexadecimal} /tb_toplevel/uut/mips_sc_processor/inst_register_file/regs(1)(23) {-radix hexadecimal} /tb_toplevel/uut/mips_sc_processor/inst_register_file/regs(1)(22) {-radix hexadecimal} /tb_toplevel/uut/mips_sc_processor/inst_register_file/regs(1)(21) {-radix hexadecimal} /tb_toplevel/uut/mips_sc_processor/inst_register_file/regs(1)(20) {-radix hexadecimal} /tb_toplevel/uut/mips_sc_processor/inst_register_file/regs(1)(19) {-radix hexadecimal} /tb_toplevel/uut/mips_sc_processor/inst_register_file/regs(1)(18) {-radix hexadecimal} /tb_toplevel/uut/mips_sc_processor/inst_register_file/regs(1)(17) {-radix hexadecimal} /tb_toplevel/uut/mips_sc_processor/inst_register_file/regs(1)(16) {-radix hexadecimal} /tb_toplevel/uut/mips_sc_processor/inst_register_file/regs(1)(15) {-radix hexadecimal} /tb_toplevel/uut/mips_sc_processor/inst_register_file/regs(1)(14) {-radix hexadecimal} /tb_toplevel/uut/mips_sc_processor/inst_register_file/regs(1)(13) {-radix hexadecimal} /tb_toplevel/uut/mips_sc_processor/inst_register_file/regs(1)(12) {-radix hexadecimal} /tb_toplevel/uut/mips_sc_processor/inst_register_file/regs(1)(11) {-radix hexadecimal} /tb_toplevel/uut/mips_sc_processor/inst_register_file/regs(1)(10) {-radix hexadecimal} /tb_toplevel/uut/mips_sc_processor/inst_register_file/regs(1)(9) {-radix hexadecimal} /tb_toplevel/uut/mips_sc_processor/inst_register_file/regs(1)(8) {-radix hexadecimal} /tb_toplevel/uut/mips_sc_processor/inst_register_file/regs(1)(7) {-radix hexadecimal} /tb_toplevel/uut/mips_sc_processor/inst_register_file/regs(1)(6) {-radix hexadecimal} /tb_toplevel/uut/mips_sc_processor/inst_register_file/regs(1)(5) {-radix hexadecimal} /tb_toplevel/uut/mips_sc_processor/inst_register_file/regs(1)(4) {-radix hexadecimal} /tb_toplevel/uut/mips_sc_processor/inst_register_file/regs(1)(3) {-radix hexadecimal} /tb_toplevel/uut/mips_sc_processor/inst_register_file/regs(1)(2) {-radix hexadecimal} /tb_toplevel/uut/mips_sc_processor/inst_register_file/regs(1)(1) {-radix hexadecimal} /tb_toplevel/uut/mips_sc_processor/inst_register_file/regs(1)(0) {-radix hexadecimal}} /tb_toplevel/uut/mips_sc_processor/inst_register_file/regs(1)
add wave -noupdate -radix hexadecimal /tb_toplevel/uut/mips_sc_processor/clk
add wave -noupdate -radix hexadecimal /tb_toplevel/uut/mips_sc_processor/reset
add wave -noupdate -radix hexadecimal /tb_toplevel/uut/mips_sc_processor/processor_enable
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/imem_address
add wave -noupdate -radix hexadecimal /tb_toplevel/uut/mips_sc_processor/imem_data_in
add wave -noupdate -radix hexadecimal /tb_toplevel/uut/mips_sc_processor/dmem_data_in
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/dmem_address
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/dmem_address_wr
add wave -noupdate -radix hexadecimal /tb_toplevel/uut/mips_sc_processor/dmem_data_out
add wave -noupdate -radix hexadecimal /tb_toplevel/uut/mips_sc_processor/dmem_write_enable
add wave -noupdate -radix hexadecimal /tb_toplevel/uut/mips_sc_processor/id_instruction
add wave -noupdate -radix hexadecimal /tb_toplevel/uut/mips_sc_processor/id_reg_write
add wave -noupdate -radix hexadecimal /tb_toplevel/uut/mips_sc_processor/ex_reg_write
add wave -noupdate -radix hexadecimal /tb_toplevel/uut/mips_sc_processor/mem_reg_write
add wave -noupdate -radix hexadecimal /tb_toplevel/uut/mips_sc_processor/wb_reg_write
add wave -noupdate -radix hexadecimal /tb_toplevel/uut/mips_sc_processor/id_mem_to_reg
add wave -noupdate -radix hexadecimal /tb_toplevel/uut/mips_sc_processor/ex_mem_to_reg
add wave -noupdate -radix hexadecimal /tb_toplevel/uut/mips_sc_processor/mem_mem_to_reg
add wave -noupdate -radix hexadecimal /tb_toplevel/uut/mips_sc_processor/wb_mem_to_reg
add wave -noupdate -radix hexadecimal /tb_toplevel/uut/mips_sc_processor/id_branch
add wave -noupdate -radix hexadecimal /tb_toplevel/uut/mips_sc_processor/ex_branch
add wave -noupdate -radix hexadecimal /tb_toplevel/uut/mips_sc_processor/mem_branch
add wave -noupdate -radix hexadecimal /tb_toplevel/uut/mips_sc_processor/id_mem_read
add wave -noupdate -radix hexadecimal /tb_toplevel/uut/mips_sc_processor/ex_mem_read
add wave -noupdate -radix hexadecimal /tb_toplevel/uut/mips_sc_processor/mem_mem_read
add wave -noupdate -radix hexadecimal /tb_toplevel/uut/mips_sc_processor/id_mem_write
add wave -noupdate -radix hexadecimal /tb_toplevel/uut/mips_sc_processor/ex_mem_write
add wave -noupdate -radix hexadecimal /tb_toplevel/uut/mips_sc_processor/mem_mem_write
add wave -noupdate -radix hexadecimal /tb_toplevel/uut/mips_sc_processor/id_reg_dst
add wave -noupdate -radix hexadecimal /tb_toplevel/uut/mips_sc_processor/ex_reg_dst
add wave -noupdate -radix hexadecimal /tb_toplevel/uut/mips_sc_processor/id_alu_op
add wave -noupdate -radix hexadecimal /tb_toplevel/uut/mips_sc_processor/ex_alu_op
add wave -noupdate -radix hexadecimal /tb_toplevel/uut/mips_sc_processor/id_alu_src
add wave -noupdate -radix hexadecimal /tb_toplevel/uut/mips_sc_processor/ex_alu_src
add wave -noupdate -radix hexadecimal /tb_toplevel/uut/mips_sc_processor/alu_y
add wave -noupdate -radix hexadecimal /tb_toplevel/uut/mips_sc_processor/alu_in
add wave -noupdate -radix hexadecimal /tb_toplevel/uut/mips_sc_processor/ex_alu_out
add wave -noupdate -radix hexadecimal /tb_toplevel/uut/mips_sc_processor/mem_alu_out
add wave -noupdate -radix hexadecimal /tb_toplevel/uut/mips_sc_processor/wb_alu_out
add wave -noupdate -radix hexadecimal /tb_toplevel/uut/mips_sc_processor/flags
add wave -noupdate -radix hexadecimal /tb_toplevel/uut/mips_sc_processor/pc_current
add wave -noupdate -radix hexadecimal /tb_toplevel/uut/mips_sc_processor/id_offset
add wave -noupdate -radix hexadecimal /tb_toplevel/uut/mips_sc_processor/ex_offset
add wave -noupdate -radix hexadecimal /tb_toplevel/uut/mips_sc_processor/ex_jump_target
add wave -noupdate -radix hexadecimal /tb_toplevel/uut/mips_sc_processor/mem_jump_target
add wave -noupdate -radix hexadecimal /tb_toplevel/uut/mips_sc_processor/if_branch_selected
add wave -noupdate -radix hexadecimal /tb_toplevel/uut/mips_sc_processor/if_jump_selected
add wave -noupdate -radix hexadecimal /tb_toplevel/uut/mips_sc_processor/if_jump_target
add wave -noupdate -radix hexadecimal /tb_toplevel/uut/mips_sc_processor/mem_zero
add wave -noupdate -radix hexadecimal /tb_toplevel/uut/mips_sc_processor/mem_branch_and_zero
add wave -noupdate -radix hexadecimal /tb_toplevel/uut/mips_sc_processor/id_jump
add wave -noupdate -radix hexadecimal /tb_toplevel/uut/mips_sc_processor/ex_jump
add wave -noupdate -radix hexadecimal /tb_toplevel/uut/mips_sc_processor/mem_jump
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/if_pc_next
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/id_pc_next
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/ex_pc_next
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/ex_branch_target
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/mem_branch_target
add wave -noupdate -radix hexadecimal /tb_toplevel/uut/mips_sc_processor/reg_write_exec
add wave -noupdate -radix hexadecimal /tb_toplevel/uut/mips_sc_processor/id_read_data_1
add wave -noupdate -radix hexadecimal /tb_toplevel/uut/mips_sc_processor/ex_read_data_1
add wave -noupdate -radix hexadecimal /tb_toplevel/uut/mips_sc_processor/id_read_data_2
add wave -noupdate -radix hexadecimal /tb_toplevel/uut/mips_sc_processor/ex_read_data_2
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/ex_rd_addr
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/mem_rd_addr
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/wb_rd_addr
add wave -noupdate -radix hexadecimal /tb_toplevel/uut/mips_sc_processor/data_to_write
add wave -noupdate -radix hexadecimal /tb_toplevel/uut/mips_sc_processor/pc_write_enable
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/ex_rt
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/ex_rd
add wave -noupdate -radix hexadecimal /tb_toplevel/uut/mips_sc_processor/wb_dmem_data_in
add wave -noupdate /tb_toplevel/clk
add wave -noupdate /tb_toplevel/reset
add wave -noupdate /tb_toplevel/command
add wave -noupdate /tb_toplevel/bus_address_in
add wave -noupdate /tb_toplevel/bus_data_in
add wave -noupdate /tb_toplevel/status
add wave -noupdate /tb_toplevel/bus_data_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {9263385 ps} 0}
configure wave -namecolwidth 364
configure wave -valuecolwidth 247
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
WaveRestoreZoom {8880778 ps} {9424596 ps}
