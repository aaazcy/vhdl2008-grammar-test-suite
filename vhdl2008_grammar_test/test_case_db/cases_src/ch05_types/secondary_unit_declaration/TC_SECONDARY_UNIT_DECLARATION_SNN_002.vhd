-- =============================================================
-- Case ID: TC_SECONDARY_UNIT_DECLARATION_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_SECONDARY_UNIT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: secondary_unit_declaration ::= identifier = physical_literal ;
-- Case Type: Negative
-- Test Focus: secondary_unit_declaration: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity secondary_unit_e2 is end entity;
architecture bh of secondary_unit_e2 is
  -- ERROR: invalid syntax in secondary_unit_declaration
  signal s : bit;
begin
  s <= '1'
end architecture bh;