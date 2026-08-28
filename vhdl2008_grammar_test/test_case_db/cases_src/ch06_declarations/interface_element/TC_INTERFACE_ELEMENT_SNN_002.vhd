-- =============================================================
-- Case ID: TC_INTERFACE_ELEMENT_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_INTERFACE_ELEMENT
-- Standard Reference: IEEE 1076-2008 Section 6.5.4
-- Production: interface_element ::= interface_declaration
-- Case Type: Negative
-- Test Focus: interface_element: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity interface_eleme_e2 is end entity;
architecture bh of interface_eleme_e2 is
  -- ERROR: invalid syntax in interface_element
  signal s : bit;
begin
  s <= '1'
end architecture bh;