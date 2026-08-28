-- =============================================================
-- Case ID: TC_PRIMARY_UNIT_DECLARATION_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_PRIMARY_UNIT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: primary_unit_declaration ::= identifier ;
-- Case Type: Negative
-- Test Focus: primary_unit_declaration: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity primary_unit_de_e2 is end entity;
architecture bh of primary_unit_de_e2 is
  -- ERROR: invalid syntax in primary_unit_declaration
  signal s : bit;
begin
  s <= '1'
end architecture bh;