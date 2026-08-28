-- =============================================================
-- Case ID: TC_PATHNAME_ELEMENT_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_PATHNAME_ELEMENT
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: pathname_element ::= entity_simple_name | component_instantiation_label
-- Case Type: Negative
-- Test Focus: SNN: reserved word as pathname_element——in .tb_top.entity.sig, entity is a VHDL reserved word and cannot be used as a pathname_element
-- Expected Result: Triggers syntax error at reserved word
-- Dependencies: None
-- =============================================================
entity pn_elem_reserved is
  port(d : in bit; q : out bit);
end entity;

architecture vhdl2008 of pn_elem_reserved is
  -- ERROR: 'entity' is a reserved word, not a valid pathname_element
  alias bad_ref is <<signal .tb_top.entity.sig : bit>>;
begin
  q <= d;
end architecture vhdl2008;
