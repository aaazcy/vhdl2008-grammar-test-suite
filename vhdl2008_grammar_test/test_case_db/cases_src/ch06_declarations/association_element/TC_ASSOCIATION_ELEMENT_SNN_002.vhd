-- =============================================================
-- Case ID: TC_ASSOCIATION_ELEMENT_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_ASSOCIATION_ELEMENT
-- Standard Reference: IEEE 1076-2008 Section 6.5.7.1
-- Production: association_element ::= [ formal_part => ] actual_part
-- Case Type: Negative
-- Test Focus: association_element: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity association_ele_e2 is end entity;
architecture bh of association_ele_e2 is
  -- ERROR: invalid syntax in association_element
  signal s : bit;
begin
  s <= '1'
end architecture bh;