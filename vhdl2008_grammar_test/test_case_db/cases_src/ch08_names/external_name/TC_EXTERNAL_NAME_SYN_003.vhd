-- =============================================================
-- Case ID: TC_EXTERNAL_NAME_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXTERNAL_NAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: external_name ::= external_constant_name | external_signal_name | external_variable_name
-- Case Type: Positive
-- Test Focus: external_name selects the external_constant_name branch — binding a constant external name of the form <<constant .cfg.MAX : integer>> via alias, verifying the complete syntax of the external_constant_name selection branch of external_name in an alias declaration
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ext_name_const_sel is
  port(val_in : in integer; overflow : out bit);
end entity;

architecture vhdl2008 of ext_name_const_sel is
  alias C_MAX is <<constant .cfg_pkg.MAX_VAL : integer>>;
begin
  process(val_in)
  begin
    if val_in > C_MAX then
      overflow <= '1';
    else
      overflow <= '0';
    end if;
  end process;
end architecture vhdl2008;
