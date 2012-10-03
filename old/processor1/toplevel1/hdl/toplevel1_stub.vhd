-------------------------------------------------------------------------------
-- toplevel1_stub.vhd
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

entity toplevel1_stub is
  port (
    fpga_0_USB_UART_RX_pin : in std_logic;
    fpga_0_USB_UART_TX_pin : out std_logic;
    fpga_0_clk_1_sys_clk_pin : in std_logic;
    fpga_0_rst_1_sys_rst_pin : in std_logic
  );
end toplevel1_stub;

architecture STRUCTURE of toplevel1_stub is

  component toplevel1 is
    port (
      fpga_0_USB_UART_RX_pin : in std_logic;
      fpga_0_USB_UART_TX_pin : out std_logic;
      fpga_0_clk_1_sys_clk_pin : in std_logic;
      fpga_0_rst_1_sys_rst_pin : in std_logic
    );
  end component;

  attribute BOX_TYPE : STRING;
  attribute BOX_TYPE of toplevel1 : component is "user_black_box";

begin

  toplevel1_i : toplevel1
    port map (
      fpga_0_USB_UART_RX_pin => fpga_0_USB_UART_RX_pin,
      fpga_0_USB_UART_TX_pin => fpga_0_USB_UART_TX_pin,
      fpga_0_clk_1_sys_clk_pin => fpga_0_clk_1_sys_clk_pin,
      fpga_0_rst_1_sys_rst_pin => fpga_0_rst_1_sys_rst_pin
    );

end architecture STRUCTURE;

