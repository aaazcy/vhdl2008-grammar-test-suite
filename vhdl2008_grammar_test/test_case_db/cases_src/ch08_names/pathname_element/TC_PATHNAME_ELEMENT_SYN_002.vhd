-- =============================================================
-- Case ID: TC_PATHNAME_ELEMENT_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_PATHNAME_ELEMENT
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: pathname_element ::= entity_simple_name | component_instantiation_label
-- Case Type: Positive
-- Test Focus: pathname_element as entity_simple_name — an entity simple name used as a pathname element in a hierarchical external name, e.g., '.tb_top' where tb_top is entity_simple_name
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity pe_entity_name_ent is
  port(observed : in bit; flag : out bit);
end entity;

architecture vhdl2008 of pe_entity_name_ent is
  alias tb_status is <<signal .tb_top.status_flag : bit>>;
  signal flag_reg : bit := '0';
begin
  process(observed)
  begin
    flag_reg <= tb_status;
  end process;
  flag <= flag_reg;
end architecture vhdl2008;
