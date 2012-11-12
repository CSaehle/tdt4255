onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_toplevel/clk
add wave -noupdate /tb_toplevel/reset
add wave -noupdate /tb_toplevel/command
add wave -noupdate /tb_toplevel/bus_address_in
add wave -noupdate /tb_toplevel/bus_data_in
add wave -noupdate /tb_toplevel/status
add wave -noupdate /tb_toplevel/bus_data_out
add wave -noupdate /tb_toplevel/clk
add wave -noupdate /tb_toplevel/reset
add wave -noupdate /tb_toplevel/command
add wave -noupdate /tb_toplevel/bus_address_in
add wave -noupdate /tb_toplevel/bus_data_in
add wave -noupdate /tb_toplevel/status
add wave -noupdate /tb_toplevel/bus_data_out
add wave -noupdate /tb_toplevel/clk
add wave -noupdate /tb_toplevel/reset
add wave -noupdate /tb_toplevel/command
add wave -noupdate /tb_toplevel/bus_address_in
add wave -noupdate /tb_toplevel/bus_data_in
add wave -noupdate /tb_toplevel/status
add wave -noupdate /tb_toplevel/bus_data_out
add wave -noupdate -radix binary /tb_toplevel/uut/mips_sc_processor/clk
add wave -noupdate -radix binary /tb_toplevel/uut/mips_sc_processor/reset
add wave -noupdate -radix binary /tb_toplevel/uut/mips_sc_processor/processor_enable
add wave -noupdate /tb_toplevel/uut/mips_sc_processor/pc_write_enable
add wave -noupdate -radix decimal /tb_toplevel/uut/data_mem/mem(1)
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/inst_register_file/regs(1)
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/inst_register_file/regs(2)
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/inst_register_file/regs(3)
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/inst_register_file/regs(4)
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/inst_register_file/regs(7)
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/inst_register_file/regs(11)
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/imem_address
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/pc_current
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/if_pc_next
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/id_pc_next
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/ex_pc_next
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/ex_branch_target
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/mem_branch_target
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/id_offset
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/ex_offset
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/if_branch_selected
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/if_jump_selected
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/if_jump_target
add wave -noupdate /tb_toplevel/uut/mips_sc_processor/mem_zero
add wave -noupdate /tb_toplevel/uut/mips_sc_processor/mem_branch_and_zero
add wave -noupdate -radix hexadecimal /tb_toplevel/uut/mips_sc_processor/dmem_data_in
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/dmem_address
add wave -noupdate -radix hexadecimal /tb_toplevel/uut/mips_sc_processor/dmem_data_out
add wave -noupdate /tb_toplevel/uut/mips_sc_processor/dmem_write_enable
add wave -noupdate -radix hexadecimal /tb_toplevel/uut/mips_sc_processor/imem_data_in
add wave -noupdate -radix hexadecimal /tb_toplevel/uut/mips_sc_processor/id_instruction
add wave -noupdate /tb_toplevel/uut/mips_sc_processor/id_reg_write
add wave -noupdate /tb_toplevel/uut/mips_sc_processor/ex_reg_write
add wave -noupdate /tb_toplevel/uut/mips_sc_processor/mem_reg_write
add wave -noupdate /tb_toplevel/uut/mips_sc_processor/wb_reg_write
add wave -noupdate /tb_toplevel/uut/mips_sc_processor/id_mem_to_reg
add wave -noupdate /tb_toplevel/uut/mips_sc_processor/ex_mem_to_reg
add wave -noupdate /tb_toplevel/uut/mips_sc_processor/mem_mem_to_reg
add wave -noupdate /tb_toplevel/uut/mips_sc_processor/wb_mem_to_reg
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/inst_alu/x
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/inst_alu/y
add wave -noupdate /tb_toplevel/uut/mips_sc_processor/alu_in
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/inst_alu/r
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/data_to_write
add wave -noupdate /tb_toplevel/uut/mips_sc_processor/id_branch
add wave -noupdate /tb_toplevel/uut/mips_sc_processor/ex_branch
add wave -noupdate /tb_toplevel/uut/mips_sc_processor/flags.zero
add wave -noupdate /tb_toplevel/uut/mips_sc_processor/mem_branch
add wave -noupdate /tb_toplevel/uut/mips_sc_processor/id_mem_read
add wave -noupdate /tb_toplevel/uut/mips_sc_processor/ex_mem_read
add wave -noupdate /tb_toplevel/uut/mips_sc_processor/mem_mem_read
add wave -noupdate /tb_toplevel/uut/mips_sc_processor/id_mem_write
add wave -noupdate /tb_toplevel/uut/mips_sc_processor/ex_mem_write
add wave -noupdate /tb_toplevel/uut/mips_sc_processor/mem_mem_write
add wave -noupdate /tb_toplevel/uut/mips_sc_processor/id_reg_dst
add wave -noupdate /tb_toplevel/uut/mips_sc_processor/ex_reg_dst
add wave -noupdate /tb_toplevel/uut/mips_sc_processor/id_alu_op
add wave -noupdate /tb_toplevel/uut/mips_sc_processor/ex_alu_op
add wave -noupdate /tb_toplevel/uut/mips_sc_processor/id_alu_src
add wave -noupdate /tb_toplevel/uut/mips_sc_processor/ex_alu_src
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/ex_alu_out
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/mem_alu_out
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/wb_alu_out
add wave -noupdate /tb_toplevel/uut/mips_sc_processor/id_jump
add wave -noupdate /tb_toplevel/uut/mips_sc_processor/reg_write_exec
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/id_read_data_1
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/id_read_data_2
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/ex_read_data_1
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/ex_read_data_2
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/ex_rd_addr
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/mem_rd_addr
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/wb_rd_addr
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/ex_rt
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/ex_rd
add wave -noupdate /tb_toplevel/uut/mips_sc_processor/forward_a
add wave -noupdate /tb_toplevel/uut/mips_sc_processor/forward_b
add wave -noupdate /tb_toplevel/clk
add wave -noupdate /tb_toplevel/reset
add wave -noupdate /tb_toplevel/command
add wave -noupdate /tb_toplevel/bus_address_in
add wave -noupdate /tb_toplevel/bus_data_in
add wave -noupdate /tb_toplevel/status
add wave -noupdate /tb_toplevel/bus_data_out
add wave -noupdate /tb_toplevel/clk
add wave -noupdate /tb_toplevel/reset
add wave -noupdate /tb_toplevel/command
add wave -noupdate /tb_toplevel/bus_address_in
add wave -noupdate /tb_toplevel/bus_data_in
add wave -noupdate /tb_toplevel/status
add wave -noupdate /tb_toplevel/bus_data_out
add wave -noupdate -radix binary /tb_toplevel/uut/mips_sc_processor/clk
add wave -noupdate -radix binary /tb_toplevel/uut/mips_sc_processor/reset
add wave -noupdate -radix binary /tb_toplevel/uut/mips_sc_processor/processor_enable
add wave -noupdate /tb_toplevel/uut/mips_sc_processor/pc_write_enable
add wave -noupdate -radix decimal /tb_toplevel/uut/data_mem/mem(1)
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/inst_register_file/regs(1)
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/inst_register_file/regs(2)
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/inst_register_file/regs(3)
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/inst_register_file/regs(4)
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/inst_register_file/regs(7)
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/inst_register_file/regs(11)
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/imem_address
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/pc_current
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/if_pc_next
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/id_pc_next
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/ex_pc_next
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/ex_branch_target
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/mem_branch_target
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/id_offset
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/ex_offset
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/if_branch_selected
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/if_jump_selected
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/if_jump_target
add wave -noupdate /tb_toplevel/uut/mips_sc_processor/mem_zero
add wave -noupdate /tb_toplevel/uut/mips_sc_processor/mem_branch_and_zero
add wave -noupdate -radix hexadecimal /tb_toplevel/uut/mips_sc_processor/dmem_data_in
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/dmem_address
add wave -noupdate -radix hexadecimal /tb_toplevel/uut/mips_sc_processor/dmem_data_out
add wave -noupdate /tb_toplevel/uut/mips_sc_processor/dmem_write_enable
add wave -noupdate -radix hexadecimal /tb_toplevel/uut/mips_sc_processor/imem_data_in
add wave -noupdate -radix hexadecimal /tb_toplevel/uut/mips_sc_processor/id_instruction
add wave -noupdate /tb_toplevel/uut/mips_sc_processor/id_reg_write
add wave -noupdate /tb_toplevel/uut/mips_sc_processor/ex_reg_write
add wave -noupdate /tb_toplevel/uut/mips_sc_processor/mem_reg_write
add wave -noupdate /tb_toplevel/uut/mips_sc_processor/wb_reg_write
add wave -noupdate /tb_toplevel/uut/mips_sc_processor/id_mem_to_reg
add wave -noupdate /tb_toplevel/uut/mips_sc_processor/ex_mem_to_reg
add wave -noupdate /tb_toplevel/uut/mips_sc_processor/mem_mem_to_reg
add wave -noupdate /tb_toplevel/uut/mips_sc_processor/wb_mem_to_reg
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/inst_alu/x
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/inst_alu/y
add wave -noupdate /tb_toplevel/uut/mips_sc_processor/alu_in
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/inst_alu/r
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/data_to_write
add wave -noupdate /tb_toplevel/uut/mips_sc_processor/id_branch
add wave -noupdate /tb_toplevel/uut/mips_sc_processor/ex_branch
add wave -noupdate /tb_toplevel/uut/mips_sc_processor/flags.zero
add wave -noupdate /tb_toplevel/uut/mips_sc_processor/mem_branch
add wave -noupdate /tb_toplevel/uut/mips_sc_processor/id_mem_read
add wave -noupdate /tb_toplevel/uut/mips_sc_processor/ex_mem_read
add wave -noupdate /tb_toplevel/uut/mips_sc_processor/mem_mem_read
add wave -noupdate /tb_toplevel/uut/mips_sc_processor/id_mem_write
add wave -noupdate /tb_toplevel/uut/mips_sc_processor/ex_mem_write
add wave -noupdate /tb_toplevel/uut/mips_sc_processor/mem_mem_write
add wave -noupdate /tb_toplevel/uut/mips_sc_processor/id_reg_dst
add wave -noupdate /tb_toplevel/uut/mips_sc_processor/ex_reg_dst
add wave -noupdate /tb_toplevel/uut/mips_sc_processor/id_alu_op
add wave -noupdate /tb_toplevel/uut/mips_sc_processor/ex_alu_op
add wave -noupdate /tb_toplevel/uut/mips_sc_processor/id_alu_src
add wave -noupdate /tb_toplevel/uut/mips_sc_processor/ex_alu_src
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/ex_alu_out
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/mem_alu_out
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/wb_alu_out
add wave -noupdate /tb_toplevel/uut/mips_sc_processor/id_jump
add wave -noupdate /tb_toplevel/uut/mips_sc_processor/reg_write_exec
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/id_read_data_1
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/id_read_data_2
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/ex_read_data_1
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/ex_read_data_2
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/ex_rd_addr
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/mem_rd_addr
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/wb_rd_addr
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/ex_rt
add wave -noupdate -radix decimal /tb_toplevel/uut/mips_sc_processor/ex_rd
add wave -noupdate /tb_toplevel/uut/mips_sc_processor/forward_a
add wave -noupdate /tb_toplevel/uut/mips_sc_processor/forward_b
add wave -noupdate /tb_toplevel/uut/mips_sc_processor/inst_hazard_detection/clk
add wave -noupdate /tb_toplevel/uut/mips_sc_processor/inst_hazard_detection/reset
add wave -noupdate /tb_toplevel/uut/mips_sc_processor/inst_hazard_detection/ex_zero
add wave -noupdate /tb_toplevel/uut/mips_sc_processor/inst_hazard_detection/ex_branch
add wave -noupdate /tb_toplevel/uut/mips_sc_processor/inst_hazard_detection/ex_mem_read
add wave -noupdate /tb_toplevel/uut/mips_sc_processor/inst_hazard_detection/ex_register_rt
add wave -noupdate /tb_toplevel/uut/mips_sc_processor/inst_hazard_detection/id_register_rs
add wave -noupdate /tb_toplevel/uut/mips_sc_processor/inst_hazard_detection/id_register_rt
add wave -noupdate /tb_toplevel/uut/mips_sc_processor/inst_hazard_detection/reset_ifid
add wave -noupdate /tb_toplevel/uut/mips_sc_processor/inst_hazard_detection/reset_idex
add wave -noupdate /tb_toplevel/uut/mips_sc_processor/inst_hazard_detection/pc_write
add wave -noupdate /tb_toplevel/uut/mips_sc_processor/inst_hazard_detection/ifid_write
add wave -noupdate /tb_toplevel/uut/mips_sc_processor/inst_hazard_detection/stall_to_mux
add wave -noupdate /tb_toplevel/uut/mips_sc_processor/inst_hazard_detection/counter
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {6836817 ps} 0}
configure wave -namecolwidth 532
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
update
WaveRestoreZoom {0 ps} {52500 ns}
