-- =============================================================
-- Case ID: TC_PATHNAME_ELEMENT_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_PATHNAME_ELEMENT
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: pathname_element ::= entity_simple_name component_instantiation_label
-- Case Type: Negative
-- Test Focus: pathname_element: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity pathname_elemen_e2 is end entity;
architecture bh of pathname_elemen_e2 is
  -- ERROR: invalid syntax in pathname_element
  signal s : bit;
begin
  s <= '1'
end architecture bh;