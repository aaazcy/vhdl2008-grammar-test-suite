-- =============================================================
-- Case ID: TC_ELEMENT_CONSTRAINT_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_ELEMENT_CONSTRAINT
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: element_constraint ::= array_constraint
--              | record_constraint
-- Case Type: Positive
-- Test Focus: element_constraint using record_constraint on an
--            array of record elements. A GPIO pin configuration
--            bank where each element is constrained per pin.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity gpio_pin_config_bank is
  port (
    clk     : in  bit;
    pin     : in  integer range 0 to 7;
    dir_in  : out bit;
    pull_up : out bit
  );
end entity gpio_pin_config_bank;

architecture rtl of gpio_pin_config_bank is
  type pin_config is record
    direction   : bit;       -- '0'=in, '1'=out
    pullup_en   : bit;
    intr_en     : bit;
  end record;
  -- element_constraint via record_constraint applied per array element
  type gpio_bank is array (0 to 7) of pin_config;
  signal pins : gpio_bank := (others =>
    (direction => '0', pullup_en => '0', intr_en => '0'));
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      dir_in  <= pins(pin).direction;
      pull_up <= pins(pin).pullup_en;
    end if;
  end process;
end architecture rtl;
