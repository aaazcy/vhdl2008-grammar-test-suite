-- =============================================================
-- Case ID: TC_ASSOCIATION_ELEMENT_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_ASSOCIATION_ELEMENT
-- Standard Reference: IEEE 1076-2008 Section 6.5.7.1
-- Production: association_element ::= [ formal_part => ] actual_part
-- Case Type: Negative
-- Test Focus: association_element: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity association_ele_e3 is end entity;
architecture bh of association_ele_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;