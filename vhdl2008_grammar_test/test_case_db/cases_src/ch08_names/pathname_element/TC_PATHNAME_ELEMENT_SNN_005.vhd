-- =============================================================
-- Case ID: TC_PATHNAME_ELEMENT_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_PATHNAME_ELEMENT
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: pathname_element ::= entity_simple_name | component_instantiation_label
-- Case Type: Negative
-- Test Focus: SNN: empty pathname_element——in ..uut.sig the pathname_element between the double dots is empty; that element satisfies neither the entity_simple_name nor the component_instantiation_label identifier syntax
-- Expected Result: Triggers syntax error at empty element
-- Dependencies: None
-- =============================================================
entity pn_elem_empty is
  port(d : in bit; q : out bit);
end entity;

architecture vhdl2008 of pn_elem_empty is
  -- ERROR: Empty pathname_element between consecutive dots
  alias bad_ref is <<signal .tb_top..uut.sig : bit>>;
begin
  q <= d;
end architecture vhdl2008;
