#################################################################
# Makefile generated by Xilinx Platform Studio 
# Project:C:\Users\chribru\Desktop\GitHub\tdt4255\processor1\toplevel1\toplevel1.xmp
#
# WARNING : This file will be re-generated every time a command
# to run a make target is invoked. So, any changes made to this  
# file manually, will be lost when make is invoked next. 
#################################################################

XILINX_EDK_DIR = /cygdrive/c/Xilinx/12.4/ISE_DS/EDK
NON_CYG_XILINX_EDK_DIR = C:/Xilinx/12.4/ISE_DS/EDK

SYSTEM = toplevel1

MHSFILE = toplevel1.mhs

MSSFILE = toplevel1.mss

FPGA_ARCH = spartan6

DEVICE = xc6slx16csg324-2

LANGUAGE = vhdl
GLOBAL_SEARCHPATHOPT = 
PROJECT_SEARCHPATHOPT = 

SEARCHPATHOPT = $(PROJECT_SEARCHPATHOPT) $(GLOBAL_SEARCHPATHOPT)

SUBMODULE_OPT = 

PLATGEN_OPTIONS = -p $(DEVICE) -lang $(LANGUAGE) $(SEARCHPATHOPT) $(SUBMODULE_OPT) -msg __xps/ise/xmsgprops.lst

LIBGEN_OPTIONS = -mhs $(MHSFILE) -p $(DEVICE) $(SEARCHPATHOPT) -msg __xps/ise/xmsgprops.lst \
                   $(MICROBLAZE_0_LIBG_OPT)

OBSERVE_PAR_OPTIONS = -error yes

TESTAPP_MEMORY_MICROBLAZE_0_OUTPUT_DIR = TestApp_Memory_microblaze_0
TESTAPP_MEMORY_MICROBLAZE_0_OUTPUT = $(TESTAPP_MEMORY_MICROBLAZE_0_OUTPUT_DIR)/executable.elf
CYG_TESTAPP_MEMORY_MICROBLAZE_0_OUTPUT_DIR = TestApp_Memory_microblaze_0
CYG_TESTAPP_MEMORY_MICROBLAZE_0_OUTPUT = $(CYG_TESTAPP_MEMORY_MICROBLAZE_0_OUTPUT_DIR)/executable.elf

TESTAPP_PERIPHERAL_MICROBLAZE_0_OUTPUT_DIR = TestApp_Peripheral_microblaze_0
TESTAPP_PERIPHERAL_MICROBLAZE_0_OUTPUT = $(TESTAPP_PERIPHERAL_MICROBLAZE_0_OUTPUT_DIR)/executable.elf
CYG_TESTAPP_PERIPHERAL_MICROBLAZE_0_OUTPUT_DIR = TestApp_Peripheral_microblaze_0
CYG_TESTAPP_PERIPHERAL_MICROBLAZE_0_OUTPUT = $(CYG_TESTAPP_PERIPHERAL_MICROBLAZE_0_OUTPUT_DIR)/executable.elf

RW_TOPLEVEL_OUTPUT_DIR = rw_toplevel
RW_TOPLEVEL_OUTPUT = $(RW_TOPLEVEL_OUTPUT_DIR)/executable.elf
CYG_RW_TOPLEVEL_OUTPUT_DIR = rw_toplevel
CYG_RW_TOPLEVEL_OUTPUT = $(CYG_RW_TOPLEVEL_OUTPUT_DIR)/executable.elf

MICROBLAZE_BOOTLOOP = $(XILINX_EDK_DIR)/sw/lib/microblaze/mb_bootloop.elf
MICROBLAZE_BOOTLOOP_LE = $(XILINX_EDK_DIR)/sw/lib/microblaze/mb_bootloop_le.elf
PPC405_BOOTLOOP = $(XILINX_EDK_DIR)/sw/lib/ppc405/ppc_bootloop.elf
PPC440_BOOTLOOP = $(XILINX_EDK_DIR)/sw/lib/ppc440/ppc440_bootloop.elf
BOOTLOOP_DIR = bootloops

MICROBLAZE_0_BOOTLOOP = $(BOOTLOOP_DIR)/microblaze_0.elf
MICROBLAZE_0_XMDSTUB = microblaze_0/code/xmdstub.elf

BRAMINIT_ELF_FILES =  $(CYG_RW_TOPLEVEL_OUTPUT) 
BRAMINIT_ELF_FILE_ARGS =   -pe microblaze_0 $(RW_TOPLEVEL_OUTPUT) 

ALL_USER_ELF_FILES = $(CYG_TESTAPP_MEMORY_MICROBLAZE_0_OUTPUT) $(CYG_TESTAPP_PERIPHERAL_MICROBLAZE_0_OUTPUT) $(CYG_RW_TOPLEVEL_OUTPUT) 

SIM_CMD = vsim

BEHAVIORAL_SIM_SCRIPT = simulation/behavioral/$(SYSTEM)_setup.do

STRUCTURAL_SIM_SCRIPT = simulation/structural/$(SYSTEM)_setup.do

TIMING_SIM_SCRIPT = simulation/timing/$(SYSTEM)_setup.do

DEFAULT_SIM_SCRIPT = $(BEHAVIORAL_SIM_SCRIPT)

MIX_LANG_SIM_OPT = -mixed yes

SIMGEN_OPTIONS = -p $(DEVICE) -lang $(LANGUAGE) $(SEARCHPATHOPT) $(BRAMINIT_ELF_FILE_ARGS) $(MIX_LANG_SIM_OPT) -msg __xps/ise/xmsgprops.lst -s mti -X C:/Users/chribru/Desktop/GitHub/tdt4255/processor1/toplevel1/


LIBRARIES =  \
       microblaze_0/lib/libxil.a 

LIBSCLEAN_TARGETS = microblaze_0_libsclean 

PROGRAMCLEAN_TARGETS = TestApp_Memory_microblaze_0_programclean TestApp_Peripheral_microblaze_0_programclean rw_toplevel_programclean 

CORE_STATE_DEVELOPMENT_FILES = 

WRAPPER_NGC_FILES = implementation/microblaze_0_wrapper.ngc \
implementation/mb_plb_wrapper.ngc \
implementation/ilmb_wrapper.ngc \
implementation/dlmb_wrapper.ngc \
implementation/dlmb_cntlr_wrapper.ngc \
implementation/ilmb_cntlr_wrapper.ngc \
implementation/lmb_bram_wrapper.ngc \
implementation/usb_uart_wrapper.ngc \
implementation/clock_generator_0_wrapper.ngc \
implementation/mdm_0_wrapper.ngc \
implementation/proc_sys_reset_0_wrapper.ngc \
implementation/toplevel1_0_wrapper.ngc

POSTSYN_NETLIST = implementation/$(SYSTEM).ngc

SYSTEM_BIT = implementation/$(SYSTEM).bit

DOWNLOAD_BIT = implementation/download.bit

SYSTEM_ACE = implementation/$(SYSTEM).ace

UCF_FILE = data/toplevel1.ucf

BMM_FILE = implementation/$(SYSTEM).bmm

BITGEN_UT_FILE = etc/bitgen.ut

XFLOW_OPT_FILE = etc/fast_runtime.opt
XFLOW_DEPENDENCY = __xps/xpsxflow.opt $(XFLOW_OPT_FILE)

XPLORER_DEPENDENCY = __xps/xplorer.opt
XPLORER_OPTIONS = -p $(DEVICE) -uc $(SYSTEM).ucf -bm $(SYSTEM).bmm -max_runs 7

FPGA_IMP_DEPENDENCY = $(BMM_FILE) $(POSTSYN_NETLIST) $(UCF_FILE) $(XFLOW_DEPENDENCY)

# cygwin path for windows
SDK_EXPORT_DIR = SDK/SDK_Export/hw
CYG_SDK_EXPORT_DIR = SDK/SDK_Export/hw
SYSTEM_HW_HANDOFF = $(SDK_EXPORT_DIR)/$(SYSTEM).xml
CYG_SYSTEM_HW_HANDOFF = $(CYG_SDK_EXPORT_DIR)/$(SYSTEM).xml
SYSTEM_HW_HANDOFF_BIT = $(SDK_EXPORT_DIR)/$(SYSTEM).bit
CYG_SYSTEM_HW_HANDOFF_BIT = $(CYG_SDK_EXPORT_DIR)/$(SYSTEM).bit
SYSTEM_HW_HANDOFF_BMM = $(SDK_EXPORT_DIR)/$(SYSTEM)_bd.bmm
CYG_SYSTEM_HW_HANDOFF_BMM = $(CYG_SDK_EXPORT_DIR)/$(SYSTEM)_bd.bmm
SYSTEM_HW_HANDOFF_DEP = $(CYG_SYSTEM_HW_HANDOFF) $(CYG_SYSTEM_HW_HANDOFF_BIT) $(CYG_SYSTEM_HW_HANDOFF_BMM)

#################################################################
# SOFTWARE APPLICATION TESTAPP_MEMORY_MICROBLAZE_0
#################################################################

TESTAPP_MEMORY_MICROBLAZE_0_SOURCES = TestApp_Memory_microblaze_0/src/TestApp_Memory.c 

TESTAPP_MEMORY_MICROBLAZE_0_HEADERS = 

TESTAPP_MEMORY_MICROBLAZE_0_CC = mb-gcc
TESTAPP_MEMORY_MICROBLAZE_0_CC_SIZE = mb-size
TESTAPP_MEMORY_MICROBLAZE_0_CC_OPT = -O2
TESTAPP_MEMORY_MICROBLAZE_0_CFLAGS = 
TESTAPP_MEMORY_MICROBLAZE_0_CC_SEARCH = # -B
TESTAPP_MEMORY_MICROBLAZE_0_LIBPATH = -L./microblaze_0/lib/ # -L
TESTAPP_MEMORY_MICROBLAZE_0_INCLUDES = -I./microblaze_0/include/ # -I
TESTAPP_MEMORY_MICROBLAZE_0_LFLAGS = # -l
TESTAPP_MEMORY_MICROBLAZE_0_LINKER_SCRIPT = TestApp_Memory_microblaze_0/src/TestApp_Memory_LinkScr.ld
TESTAPP_MEMORY_MICROBLAZE_0_LINKER_SCRIPT_FLAG = -T $(TESTAPP_MEMORY_MICROBLAZE_0_LINKER_SCRIPT) 
TESTAPP_MEMORY_MICROBLAZE_0_CC_DEBUG_FLAG =  -g 
TESTAPP_MEMORY_MICROBLAZE_0_CC_PROFILE_FLAG = # -pg
TESTAPP_MEMORY_MICROBLAZE_0_CC_GLOBPTR_FLAG= # -mxl-gp-opt
TESTAPP_MEMORY_MICROBLAZE_0_MODE = executable
TESTAPP_MEMORY_MICROBLAZE_0_LIBG_OPT = -$(TESTAPP_MEMORY_MICROBLAZE_0_MODE) microblaze_0
TESTAPP_MEMORY_MICROBLAZE_0_CC_INFERRED_FLAGS= -mno-xl-soft-mul -mxl-barrel-shift -mxl-pattern-compare -mcpu=v8.00.b 
TESTAPP_MEMORY_MICROBLAZE_0_CC_START_ADDR_FLAG=  #  # -Wl,-defsym -Wl,_TEXT_START_ADDR=
TESTAPP_MEMORY_MICROBLAZE_0_CC_STACK_SIZE_FLAG=  #  # -Wl,-defsym -Wl,_STACK_SIZE=
TESTAPP_MEMORY_MICROBLAZE_0_CC_HEAP_SIZE_FLAG=  #  # -Wl,-defsym -Wl,_HEAP_SIZE=
TESTAPP_MEMORY_MICROBLAZE_0_OTHER_CC_FLAGS= $(TESTAPP_MEMORY_MICROBLAZE_0_CC_GLOBPTR_FLAG)  \
                  $(TESTAPP_MEMORY_MICROBLAZE_0_CC_START_ADDR_FLAG) $(TESTAPP_MEMORY_MICROBLAZE_0_CC_STACK_SIZE_FLAG) $(TESTAPP_MEMORY_MICROBLAZE_0_CC_HEAP_SIZE_FLAG)  \
                  $(TESTAPP_MEMORY_MICROBLAZE_0_CC_INFERRED_FLAGS)  \
                  $(TESTAPP_MEMORY_MICROBLAZE_0_LINKER_SCRIPT_FLAG) $(TESTAPP_MEMORY_MICROBLAZE_0_CC_DEBUG_FLAG) $(TESTAPP_MEMORY_MICROBLAZE_0_CC_PROFILE_FLAG) 

#################################################################
# SOFTWARE APPLICATION TESTAPP_PERIPHERAL_MICROBLAZE_0
#################################################################

TESTAPP_PERIPHERAL_MICROBLAZE_0_SOURCES = TestApp_Peripheral_microblaze_0/src/TestApp_Peripheral.c TestApp_Peripheral_microblaze_0/src/xuartlite_selftest_example.c 

TESTAPP_PERIPHERAL_MICROBLAZE_0_HEADERS = TestApp_Peripheral_microblaze_0/src/uartlite_header.h 

TESTAPP_PERIPHERAL_MICROBLAZE_0_CC = mb-gcc
TESTAPP_PERIPHERAL_MICROBLAZE_0_CC_SIZE = mb-size
TESTAPP_PERIPHERAL_MICROBLAZE_0_CC_OPT = -O2
TESTAPP_PERIPHERAL_MICROBLAZE_0_CFLAGS = 
TESTAPP_PERIPHERAL_MICROBLAZE_0_CC_SEARCH = # -B
TESTAPP_PERIPHERAL_MICROBLAZE_0_LIBPATH = -L./microblaze_0/lib/ # -L
TESTAPP_PERIPHERAL_MICROBLAZE_0_INCLUDES = -I./microblaze_0/include/  -ITestApp_Peripheral_microblaze_0/src/ # -I
TESTAPP_PERIPHERAL_MICROBLAZE_0_LFLAGS = # -l
TESTAPP_PERIPHERAL_MICROBLAZE_0_LINKER_SCRIPT = TestApp_Peripheral_microblaze_0/src/TestApp_Peripheral_LinkScr.ld
TESTAPP_PERIPHERAL_MICROBLAZE_0_LINKER_SCRIPT_FLAG = -T $(TESTAPP_PERIPHERAL_MICROBLAZE_0_LINKER_SCRIPT) 
TESTAPP_PERIPHERAL_MICROBLAZE_0_CC_DEBUG_FLAG =  -g 
TESTAPP_PERIPHERAL_MICROBLAZE_0_CC_PROFILE_FLAG = # -pg
TESTAPP_PERIPHERAL_MICROBLAZE_0_CC_GLOBPTR_FLAG= # -mxl-gp-opt
TESTAPP_PERIPHERAL_MICROBLAZE_0_MODE = executable
TESTAPP_PERIPHERAL_MICROBLAZE_0_LIBG_OPT = -$(TESTAPP_PERIPHERAL_MICROBLAZE_0_MODE) microblaze_0
TESTAPP_PERIPHERAL_MICROBLAZE_0_CC_INFERRED_FLAGS= -mno-xl-soft-mul -mxl-barrel-shift -mxl-pattern-compare -mcpu=v8.00.b 
TESTAPP_PERIPHERAL_MICROBLAZE_0_CC_START_ADDR_FLAG=  #  # -Wl,-defsym -Wl,_TEXT_START_ADDR=
TESTAPP_PERIPHERAL_MICROBLAZE_0_CC_STACK_SIZE_FLAG=  #  # -Wl,-defsym -Wl,_STACK_SIZE=
TESTAPP_PERIPHERAL_MICROBLAZE_0_CC_HEAP_SIZE_FLAG=  #  # -Wl,-defsym -Wl,_HEAP_SIZE=
TESTAPP_PERIPHERAL_MICROBLAZE_0_OTHER_CC_FLAGS= $(TESTAPP_PERIPHERAL_MICROBLAZE_0_CC_GLOBPTR_FLAG)  \
                  $(TESTAPP_PERIPHERAL_MICROBLAZE_0_CC_START_ADDR_FLAG) $(TESTAPP_PERIPHERAL_MICROBLAZE_0_CC_STACK_SIZE_FLAG) $(TESTAPP_PERIPHERAL_MICROBLAZE_0_CC_HEAP_SIZE_FLAG)  \
                  $(TESTAPP_PERIPHERAL_MICROBLAZE_0_CC_INFERRED_FLAGS)  \
                  $(TESTAPP_PERIPHERAL_MICROBLAZE_0_LINKER_SCRIPT_FLAG) $(TESTAPP_PERIPHERAL_MICROBLAZE_0_CC_DEBUG_FLAG) $(TESTAPP_PERIPHERAL_MICROBLAZE_0_CC_PROFILE_FLAG) 

#################################################################
# SOFTWARE APPLICATION RW_TOPLEVEL
#################################################################

RW_TOPLEVEL_SOURCES = main.c 

RW_TOPLEVEL_HEADERS = drivers/toplevel1_v1_00_a/src/toplevel1.h 

RW_TOPLEVEL_CC = mb-gcc
RW_TOPLEVEL_CC_SIZE = mb-size
RW_TOPLEVEL_CC_OPT = -O2
RW_TOPLEVEL_CFLAGS = 
RW_TOPLEVEL_CC_SEARCH = # -B
RW_TOPLEVEL_LIBPATH = -L./microblaze_0/lib/ # -L
RW_TOPLEVEL_INCLUDES = -I./microblaze_0/include/  -Idrivers/toplevel1_v1_00_a/src/ # -I
RW_TOPLEVEL_LFLAGS = # -l
RW_TOPLEVEL_LINKER_SCRIPT = rw_toplevel/rw_toplevel_linker_script.ld
RW_TOPLEVEL_LINKER_SCRIPT_FLAG = -T $(RW_TOPLEVEL_LINKER_SCRIPT) 
RW_TOPLEVEL_CC_DEBUG_FLAG =  -g 
RW_TOPLEVEL_CC_PROFILE_FLAG = # -pg
RW_TOPLEVEL_CC_GLOBPTR_FLAG= # -mxl-gp-opt
RW_TOPLEVEL_MODE = executable
RW_TOPLEVEL_LIBG_OPT = -$(RW_TOPLEVEL_MODE) microblaze_0
RW_TOPLEVEL_CC_INFERRED_FLAGS= -mno-xl-soft-mul -mxl-barrel-shift -mxl-pattern-compare -mcpu=v8.00.b 
RW_TOPLEVEL_CC_START_ADDR_FLAG=  #  # -Wl,-defsym -Wl,_TEXT_START_ADDR=
RW_TOPLEVEL_CC_STACK_SIZE_FLAG=  #  # -Wl,-defsym -Wl,_STACK_SIZE=
RW_TOPLEVEL_CC_HEAP_SIZE_FLAG=  #  # -Wl,-defsym -Wl,_HEAP_SIZE=
RW_TOPLEVEL_OTHER_CC_FLAGS= $(RW_TOPLEVEL_CC_GLOBPTR_FLAG)  \
                  $(RW_TOPLEVEL_CC_START_ADDR_FLAG) $(RW_TOPLEVEL_CC_STACK_SIZE_FLAG) $(RW_TOPLEVEL_CC_HEAP_SIZE_FLAG)  \
                  $(RW_TOPLEVEL_CC_INFERRED_FLAGS)  \
                  $(RW_TOPLEVEL_LINKER_SCRIPT_FLAG) $(RW_TOPLEVEL_CC_DEBUG_FLAG) $(RW_TOPLEVEL_CC_PROFILE_FLAG) 
