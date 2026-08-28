-- =============================================================
-- Case ID: TC_PATHNAME_ELEMENT_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_PATHNAME_ELEMENT
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: pathname_element ::= entity_simple_name | component_instantiation_label
-- Case Type: Positive
-- Test Focus: Extended identifier as pathname_element——.tb_top.\core_top\ uses a backslash-escaped identifier as an instance label, verifying that an entity_simple_name or label can be an extended_identifier
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity pn_elem_extid is
  port(clk : in bit; mon : out bit);
end entity;

architecture vhdl2008 of pn_elem_extid is
  alias core_en is <<signal .tb_top.\u_core_top\.enable : bit>>;
  signal reg : bit := '0';
begin
  process(clk)
  begin
    if rising_edge(clk) then reg <= core_en; end if;
  end process;
  mon <= reg;
end architecture vhdl2008;
