##############################################################################
## Filename:          C:\Users\chribru\Desktop\GitHub\tdt4255\processor1\toplevel1/drivers/toplevel1_v1_00_a/data/toplevel1_v2_1_0.tcl
## Description:       Microprocess Driver Command (tcl)
## Date:              Wed Oct 03 20:39:43 2012 (by Create and Import Peripheral Wizard)
##############################################################################

#uses "xillib.tcl"

proc generate {drv_handle} {
  xdefine_include_file $drv_handle "xparameters.h" "toplevel1" "NUM_INSTANCES" "DEVICE_ID" "C_BASEADDR" "C_HIGHADDR" 
}
