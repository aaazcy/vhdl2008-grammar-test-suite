-- =============================================================
-- Case ID: TC_SUBTYPE_DECLARATION_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBTYPE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.3
-- Production: subtype_declaration ::= subtype identifier is subtype_indication ;
-- Case Type: Negative
-- Test Focus: subtype_declaration: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity subtype_declara_e2 is end entity;
architecture bh of subtype_declara_e2 is
  -- ERROR: invalid syntax in subtype_declaration
  signal s : bit;
begin
  s <= '1'
end architecture bh;