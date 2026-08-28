-- =============================================================
-- Case ID: TC_PATHNAME_ELEMENT_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_PATHNAME_ELEMENT
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: pathname_element ::= entity_simple_name | component_instantiation_label
-- Case Type: Negative
-- Test Focus: SNN: illegal pathname_element starting with a digit——in .tb_top.12unit.sig, 12unit starts with a digit and is not a legal simple_name or label
-- Expected Result: Triggers syntax error at invalid identifier
-- Dependencies: None
-- =============================================================
entity pn_elem_bad_id is
  port(d : in bit; q : out bit);
end entity;

architecture vhdl2008 of pn_elem_bad_id is
  -- ERROR: '12unit' starts with digit — not a valid simple_name
  alias bad_ref is <<signal .tb_top.12unit.sig : bit>>;
begin
  q <= d;
end architecture vhdl2008;
