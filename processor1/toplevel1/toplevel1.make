#################################################################
# Makefile generated by Xilinx Platform Studio 
# Project:C:\Users\chribru\Desktop\GitHub\tdt4255\processor1\toplevel1\toplevel1.xmp
#
# WARNING : This file will be re-generated every time a command
# to run a make target is invoked. So, any changes made to this  
# file manually, will be lost when make is invoked next. 
#################################################################

# Name of the Microprocessor system
# The hardware specification of the system is in file :
# C:\Users\chribru\Desktop\GitHub\tdt4255\processor1\toplevel1\toplevel1.mhs
# The software specification of the system is in file :
# C:\Users\chribru\Desktop\GitHub\tdt4255\processor1\toplevel1\toplevel1.mss

include toplevel1_incl.make

#################################################################
# PHONY TARGETS
#################################################################
.PHONY: dummy
.PHONY: netlistclean
.PHONY: bitsclean
.PHONY: simclean
.PHONY: exporttosdk

#################################################################
# EXTERNAL TARGETS
#################################################################
all:
	@echo "Makefile to build a Microprocessor system :"
	@echo "Run make with any of the following targets"
	@echo " "
	@echo "  netlist  : Generates the netlist for the given MHS "
	@echo "  bits     : Runs Implementation tools to generate the bitstream"
	@echo "  exporttosdk: Export files to SDK"
	@echo " "
	@echo "  libs     : Configures the sw libraries for this system"
	@echo "  program  : Compiles the program sources for all the processor instances"
	@echo "  initprogram  : Compiles the program sources for the application that is marked for BRAM initialization"
	@echo " "
	@echo "  init_bram: Initializes bitstream with BRAM data"
	@echo "  ace      : Generate ace file from bitstream and elf"
	@echo "  download : Downloads the bitstream onto the board"
	@echo " "
	@echo "  sim      : Generates HDL simulation models and runs simulator for chosen simulation mode"
	@echo "  simmodel : Generates HDL simulation models for chosen simulation mode"
	@echo "  behavioral_model : Generates behavioral HDL models with BRAM initialization"
	@echo "  structural_model : Generates structural simulation HDL models with BRAM initialization"
	@echo "  timing   : Generates timing simulation HDL models with BRAM initialization"
	@echo " "
	@echo "  netlistclean: Deletes netlist"
	@echo "  bitsclean: Deletes bit, ncd, bmm files"
	@echo "  hwclean  : Deletes implementation dir"
	@echo "  libsclean: Deletes sw libraries"
	@echo "  programclean: Deletes compiled ELF files"
	@echo "  swclean  : Deletes sw libraries and ELF files"
	@echo "  simclean : Deletes simulation dir"
	@echo "  clean    : Deletes all generated files/directories"
	@echo " "
	@echo "  make <target> : (Default)"
	@echo "      Creates a Microprocessor system using default initializations"
	@echo "      specified for each processor in MSS file"


bits: $(SYSTEM_BIT)

ace: $(SYSTEM_ACE)

exporttosdk: $(SYSTEM_HW_HANDOFF_DEP)

netlist: $(POSTSYN_NETLIST)

libs: $(LIBRARIES)

program: $(ALL_USER_ELF_FILES)

initprogram: $(BRAMINIT_ELF_FILES)

download: $(DOWNLOAD_BIT) dummy
	@echo "*********************************************"
	@echo "Downloading Bitstream onto the target board"
	@echo "*********************************************"
	impact -batch etc/download.cmd

init_bram: $(DOWNLOAD_BIT)

sim: $(DEFAULT_SIM_SCRIPT)
	cd simulation/behavioral; \
	$(SIM_CMD) -gui -do $(^F) &

simmodel: $(DEFAULT_SIM_SCRIPT)

behavioral_model: $(BEHAVIORAL_SIM_SCRIPT)

structural_model: $(STRUCTURAL_SIM_SCRIPT)

clean: hwclean swclean simclean
	rm -f _impact.cmd

hwclean: netlistclean bitsclean
	rm -rf implementation synthesis xst hdl
	rm -rf xst.srp $(SYSTEM).srp
	rm -f __xps/ise/_xmsgs/bitinit.xmsgs

netlistclean:
	rm -f $(POSTSYN_NETLIST)
	rm -f platgen.log
	rm -f __xps/ise/_xmsgs/platgen.xmsgs
	touch __xps/ise/$(SYSTEM).xpssyn
	rm -f $(BMM_FILE)

bitsclean:
	rm -f $(SYSTEM_BIT)
	rm -f implementation/$(SYSTEM).ncd
	rm -f implementation/$(SYSTEM)_bd.bmm 
	rm -f implementation/$(SYSTEM)_map.ncd 
	rm -f __xps/$(SYSTEM)_routed

simclean: 
	rm -rf simulation/behavioral
	rm -f simgen.log
	rm -f __xps/ise/_xmsgs/simgen.xmsgs
	touch __xps/ise/$(SYSTEM).xpssim

swclean: libsclean programclean
	touch __xps/ise/$(SYSTEM).xpsupb

libsclean: $(LIBSCLEAN_TARGETS)
	rm -f libgen.log
	rm -f __xps/ise/_xmsgs/libgen.xmsgs

programclean: $(PROGRAMCLEAN_TARGETS)

#################################################################
# SOFTWARE PLATFORM FLOW
#################################################################


$(LIBRARIES): $(MHSFILE) $(MSSFILE) __xps/libgen.opt
	@echo "*********************************************"
	@echo "Creating software libraries..."
	@echo "*********************************************"
	libgen $(LIBGEN_OPTIONS) $(MSSFILE)


microblaze_0_libsclean:
	rm -rf microblaze_0/

#################################################################
# SOFTWARE APPLICATION TESTAPP_MEMORY_MICROBLAZE_0
#################################################################

TestApp_Memory_microblaze_0_program: $(CYG_TESTAPP_MEMORY_MICROBLAZE_0_OUTPUT) 

$(CYG_TESTAPP_MEMORY_MICROBLAZE_0_OUTPUT) : $(TESTAPP_MEMORY_MICROBLAZE_0_SOURCES) $(TESTAPP_MEMORY_MICROBLAZE_0_HEADERS) $(TESTAPP_MEMORY_MICROBLAZE_0_LINKER_SCRIPT) \
                    $(LIBRARIES) __xps/testapp_memory_microblaze_0_compiler.opt
	@mkdir -p $(TESTAPP_MEMORY_MICROBLAZE_0_OUTPUT_DIR) 
	$(TESTAPP_MEMORY_MICROBLAZE_0_CC) $(TESTAPP_MEMORY_MICROBLAZE_0_CC_OPT) $(TESTAPP_MEMORY_MICROBLAZE_0_SOURCES) -o $(CYG_TESTAPP_MEMORY_MICROBLAZE_0_OUTPUT) \
	$(TESTAPP_MEMORY_MICROBLAZE_0_OTHER_CC_FLAGS) $(TESTAPP_MEMORY_MICROBLAZE_0_INCLUDES) $(TESTAPP_MEMORY_MICROBLAZE_0_LIBPATH) \
	$(TESTAPP_MEMORY_MICROBLAZE_0_CFLAGS) $(TESTAPP_MEMORY_MICROBLAZE_0_LFLAGS) 
	$(TESTAPP_MEMORY_MICROBLAZE_0_CC_SIZE) $(CYG_TESTAPP_MEMORY_MICROBLAZE_0_OUTPUT) 
	@echo ""

TestApp_Memory_microblaze_0_programclean:
	rm -f $(TESTAPP_MEMORY_MICROBLAZE_0_OUTPUT) 

#################################################################
# SOFTWARE APPLICATION TESTAPP_PERIPHERAL_MICROBLAZE_0
#################################################################

TestApp_Peripheral_microblaze_0_program: $(CYG_TESTAPP_PERIPHERAL_MICROBLAZE_0_OUTPUT) 

$(CYG_TESTAPP_PERIPHERAL_MICROBLAZE_0_OUTPUT) : $(TESTAPP_PERIPHERAL_MICROBLAZE_0_SOURCES) $(TESTAPP_PERIPHERAL_MICROBLAZE_0_HEADERS) $(TESTAPP_PERIPHERAL_MICROBLAZE_0_LINKER_SCRIPT) \
                    $(LIBRARIES) __xps/testapp_peripheral_microblaze_0_compiler.opt
	@mkdir -p $(TESTAPP_PERIPHERAL_MICROBLAZE_0_OUTPUT_DIR) 
	$(TESTAPP_PERIPHERAL_MICROBLAZE_0_CC) $(TESTAPP_PERIPHERAL_MICROBLAZE_0_CC_OPT) $(TESTAPP_PERIPHERAL_MICROBLAZE_0_SOURCES) -o $(CYG_TESTAPP_PERIPHERAL_MICROBLAZE_0_OUTPUT) \
	$(TESTAPP_PERIPHERAL_MICROBLAZE_0_OTHER_CC_FLAGS) $(TESTAPP_PERIPHERAL_MICROBLAZE_0_INCLUDES) $(TESTAPP_PERIPHERAL_MICROBLAZE_0_LIBPATH) \
	$(TESTAPP_PERIPHERAL_MICROBLAZE_0_CFLAGS) $(TESTAPP_PERIPHERAL_MICROBLAZE_0_LFLAGS) 
	$(TESTAPP_PERIPHERAL_MICROBLAZE_0_CC_SIZE) $(CYG_TESTAPP_PERIPHERAL_MICROBLAZE_0_OUTPUT) 
	@echo ""

TestApp_Peripheral_microblaze_0_programclean:
	rm -f $(TESTAPP_PERIPHERAL_MICROBLAZE_0_OUTPUT) 

#################################################################
# SOFTWARE APPLICATION RW_TOPLEVEL
#################################################################

rw_toplevel_program: $(CYG_RW_TOPLEVEL_OUTPUT) 

$(CYG_RW_TOPLEVEL_OUTPUT) : $(RW_TOPLEVEL_SOURCES) $(RW_TOPLEVEL_HEADERS) $(RW_TOPLEVEL_LINKER_SCRIPT) \
                    $(LIBRARIES) __xps/rw_toplevel_compiler.opt
	@mkdir -p $(RW_TOPLEVEL_OUTPUT_DIR) 
	$(RW_TOPLEVEL_CC) $(RW_TOPLEVEL_CC_OPT) $(RW_TOPLEVEL_SOURCES) -o $(CYG_RW_TOPLEVEL_OUTPUT) \
	$(RW_TOPLEVEL_OTHER_CC_FLAGS) $(RW_TOPLEVEL_INCLUDES) $(RW_TOPLEVEL_LIBPATH) \
	$(RW_TOPLEVEL_CFLAGS) $(RW_TOPLEVEL_LFLAGS) 
	$(RW_TOPLEVEL_CC_SIZE) $(CYG_RW_TOPLEVEL_OUTPUT) 
	@echo ""

rw_toplevel_programclean:
	rm -f $(RW_TOPLEVEL_OUTPUT) 

#################################################################
# BOOTLOOP ELF FILES
#################################################################



$(MICROBLAZE_0_BOOTLOOP): $(MICROBLAZE_BOOTLOOP)
	@mkdir -p $(BOOTLOOP_DIR)
	cp -f $(MICROBLAZE_BOOTLOOP) $(MICROBLAZE_0_BOOTLOOP)

#################################################################
# HARDWARE IMPLEMENTATION FLOW
#################################################################


$(BMM_FILE) \
$(WRAPPER_NGC_FILES): $(MHSFILE) __xps/platgen.opt \
                      $(CORE_STATE_DEVELOPMENT_FILES)
	@echo "****************************************************"
	@echo "Creating system netlist for hardware specification.."
	@echo "****************************************************"
	platgen $(PLATGEN_OPTIONS) $(MHSFILE)

$(POSTSYN_NETLIST): $(WRAPPER_NGC_FILES)
	@echo "Running synthesis..."
	bash -c "cd synthesis; ./synthesis.sh"

$(SYSTEM_BIT): 
	@echo "This project has been instantiated in Xilinx ISE Project Navigator. Please use ProjNav to generate the bitstream. "

$(DOWNLOAD_BIT): $(SYSTEM_BIT) $(BRAMINIT_ELF_FILES) __xps/bitinit.opt
	@cp -f implementation/$(SYSTEM)_bd.bmm .
	@echo "*********************************************"
	@echo "Initializing BRAM contents of the bitstream"
	@echo "*********************************************"
	bitinit -p $(DEVICE) $(MHSFILE) $(SEARCHPATHOPT) $(BRAMINIT_ELF_FILE_ARGS) \
	-bt $(SYSTEM_BIT) -o $(DOWNLOAD_BIT)
	@rm -f $(SYSTEM)_bd.bmm

$(SYSTEM_ACE):
	@echo "In order to generate ace file, you must have:-"
	@echo "- exactly one processor."
	@echo "- opb_mdm, if using microblaze."

#################################################################
# EXPORT_TO_SDK FLOW
#################################################################


$(CYG_SYSTEM_HW_HANDOFF): $(MHSFILE) __xps/platgen.opt
	mkdir -p $(SDK_EXPORT_DIR)
	psf2Edward.exe -inp $(SYSTEM).xmp -edwver 1.2 -xml $(SDK_EXPORT_DIR)/$(SYSTEM).xml $(GLOBAL_SEARCHPATHOPT)
	xdsgen.exe -inp $(SYSTEM).xmp -report $(SDK_EXPORT_DIR)/$(SYSTEM).html $(GLOBAL_SEARCHPATHOPT) -make_docs_local
	@echo "This project has been instantiated in Xilinx ISE Project Navigator. Please use ProjNav to generate the bitstream and then copy the $(SYSTEM)_bd.bmm and $(SYSTEM).bit files manually... "

#################################################################
# SIMULATION FLOW
#################################################################


################## BEHAVIORAL SIMULATION ##################

$(BEHAVIORAL_SIM_SCRIPT): $(MHSFILE) __xps/simgen.opt \
                          $(BRAMINIT_ELF_FILES)
	@echo "*********************************************"
	@echo "Creating behavioral simulation models..."
	@echo "*********************************************"
	simgen $(SIMGEN_OPTIONS) -m behavioral $(MHSFILE)

################## STRUCTURAL SIMULATION ##################

$(STRUCTURAL_SIM_SCRIPT):
	@echo "Structural simulation of complete design (including toplevel) flow should be done in ProjNav"


################## TIMING SIMULATION ##################

$(TIMING_SIM_SCRIPT):
	@echo "Timing simulation of complete design (including toplevel) flow should be done in ProjNav"

dummy:
	@echo ""

