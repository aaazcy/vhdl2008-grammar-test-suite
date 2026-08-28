-- =============================================================
-- Case ID: TC_SELECTED_NAME_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_SELECTED_NAME
-- Standard Reference: IEEE 1076-2008 Section 8.5
-- Production: selected_name ::= prefix . suffix
-- Case Type: Positive
-- Test Focus: selected_name chained dot selection——lib.pkg.item is a two-level dot-selection form; the prefix can be another selected_name, verifying the recursive chained syntax of selected_name
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sel_name_chain_dot is
  port(compare_val : in integer; matched : out bit);
end entity;

architecture vhdl2008 of sel_name_chain_dot is
  alias C_REF is <<constant @work.param_pkg.CONFIG_VAL : integer>>;
begin
  process(compare_val)
  begin
    if compare_val = C_REF then matched <= '1';
    else matched <= '0'; end if;
  end process;
end architecture vhdl2008;
