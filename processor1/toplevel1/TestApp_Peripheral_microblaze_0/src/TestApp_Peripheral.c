/*
 *
 * Xilinx, Inc.
 * XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS" AS A 
 * COURTESY TO YOU.  BY PROVIDING THIS DESIGN, CODE, OR INFORMATION AS
 * ONE POSSIBLE   IMPLEMENTATION OF THIS FEATURE, APPLICATION OR 
 * STANDARD, XILINX IS MAKING NO REPRESENTATION THAT THIS IMPLEMENTATION 
 * IS FREE FROM ANY CLAIMS OF INFRINGEMENT, AND YOU ARE RESPONSIBLE 
 * FOR OBTAINING ANY RIGHTS YOU MAY REQUIRE FOR YOUR IMPLEMENTATION
 * XILINX EXPRESSLY DISCLAIMS ANY WARRANTY WHATSOEVER WITH RESPECT TO 
 * THE ADEQUACY OF THE IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO 
 * ANY WARRANTIES OR REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE 
 * FROM CLAIMS OF INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY 
 * AND FITNESS FOR A PARTICULAR PURPOSE.
 */

/*
 * Xilinx EDK 12.4 EDK_MS4.81d
 *
 * This file is a sample test application
 *
 * This application is intended to test and/or illustrate some 
 * functionality of your system.  The contents of this file may
 * vary depending on the IP in your system and may use existing
 * IP driver functions.  These drivers will be generated in your
 * XPS project when you run the "Generate Libraries" menu item
 * in XPS.
 *
 * Your XPS project directory is at:
 *    C:\Users\chribru\Desktop\GitHub\tdt4255\processor1\toplevel1\
 */


// Located in: microblaze_0/include/xparameters.h
#include "xparameters.h"

#include "stdio.h"

#include "uartlite_header.h"

//====================================================

int main (void) {


   /*
    * Enable and initialize cache
    */
   #if XPAR_MICROBLAZE_0_USE_ICACHE
      Xil_ICacheInvalidate();
      Xil_ICacheEnable();
   #endif

   #if XPAR_MICROBLAZE_0_USE_DCACHE
      Xil_DCacheInvalidate();
       Xil_DCacheEnable();
   #endif

   print("-- Entering main() --\r\n");

   /*
    * Peripheral SelfTest will not be run for USB_UART
    * because it has been selected as the STDOUT device
    */



   {
      int status;
      
      print("\r\nRunning UartLiteSelfTestExample() for mdm_0...\r\n");
      status = UartLiteSelfTestExample(XPAR_MDM_0_DEVICE_ID);
      if (status == 0) {
         print("UartLiteSelfTestExample PASSED\r\n");
      }
      else {
         print("UartLiteSelfTestExample FAILED\r\n");
      }
   }
   /*
    * Disable cache and reinitialize it so that other
    * applications can be run with no problems
    */
   #if XPAR_MICROBLAZE_0_USE_DCACHE
      Xil_DCacheDisable();
      Xil_DCacheInvalidate();
   #endif

   #if XPAR_MICROBLAZE_0_USE_ICACHE
      Xil_ICacheDisable();
      Xil_ICacheInvalidate();
   #endif


   print("-- Exiting main() --\r\n");
   return 0;
}

