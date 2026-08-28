-- =============================================================
-- Case ID: TC_COMPOSITE_TYPE_DEFINITION_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_COMPOSITE_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.3.1
-- Production: composite_type_definition ::= array_type_definition
--              | record_type_definition
-- Case Type: Positive
-- Test Focus: composite_type_definition choosing record_type_definition.
--            A UART configuration register with distinct bit fields
--            modeled as a record type definition.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity uart_config_register is
  port (
    clk        : in  bit;
    we         : in  bit;
    baud_sel   : in  integer range 0 to 3;
    parity_en  : in  bit;
    stop_bits  : in  integer range 1 to 2;
    config_out : out bit_vector(7 downto 0)
  );
end entity uart_config_register;

architecture rtl of uart_config_register is
  -- composite_type_definition: record_type_definition
  type uart_config is record
    baud_rate   : integer range 0 to 3;
    parity      : bit;
    stop_width  : integer range 1 to 2;
    rx_enable   : bit;
    tx_enable   : bit;
  end record;
  signal cfg : uart_config;
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      if we = '1' then
        cfg.baud_rate  <= baud_sel;
        cfg.parity     <= parity_en;
        cfg.stop_width <= stop_bits;
        cfg.rx_enable  <= '1';
        cfg.tx_enable  <= '1';
      end if;
    end if;
  end process;
  config_out(1 downto 0) <=
    "00" when cfg.baud_rate = 0 else
    "01" when cfg.baud_rate = 1 else
    "10" when cfg.baud_rate = 2 else "11";
  config_out(2) <= cfg.parity;
  config_out(3) <= '1' when cfg.stop_width = 2 else '0';
  config_out(5 downto 4) <= cfg.rx_enable & cfg.tx_enable;
  config_out(7 downto 6) <= "00";
end architecture rtl;
