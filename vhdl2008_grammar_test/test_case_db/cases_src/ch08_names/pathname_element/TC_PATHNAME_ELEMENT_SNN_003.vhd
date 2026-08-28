-- =============================================================
-- Case ID: TC_PATHNAME_ELEMENT_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_PATHNAME_ELEMENT
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: pathname_element ::= entity_simple_name component_instantiation_label
-- Case Type: Negative
-- Test Focus: pathname_element: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity pathname_elemen_e3 is end entity;
architecture bh of pathname_elemen_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;