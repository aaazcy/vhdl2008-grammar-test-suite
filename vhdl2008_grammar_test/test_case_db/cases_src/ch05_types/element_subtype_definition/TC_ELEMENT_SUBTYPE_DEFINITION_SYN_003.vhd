-- =============================================================
-- Case ID: TC_ELEMENT_SUBTYPE_DEFINITION_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_ELEMENT_SUBTYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: element_subtype_definition ::= subtype_indication
-- Case Type: Positive
-- Test Focus: element_subtype_definition in record field context.
--            A PLL configuration register with constrained
--            integer fields defining valid PLL parameter ranges.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity pll_config_register is
  port (
    clk       : in  bit;
    mult_sel  : in  integer range 1 to 64;
    div_sel   : in  integer range 1 to 16;
    lock      : out bit
  );
end entity pll_config_register;

architecture rtl of pll_config_register is
  -- element_subtype_definition for record fields
  subtype multiplier_t is integer range 1 to 64;
  subtype divider_t    is integer range 1 to 16;
  type pll_config is record
    multiplier : multiplier_t;
    divider    : divider_t;
    locked     : bit;
  end record;
  signal config : pll_config := (multiplier => 1, divider => 1, locked => '0');
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      config.multiplier <= mult_sel;
      config.divider    <= div_sel;
      lock <= config.locked;
    end if;
  end process;
end architecture rtl;
