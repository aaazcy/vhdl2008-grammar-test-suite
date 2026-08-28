-- =============================================================
-- Case ID: TC_SUBTYPE_DECLARATION_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBTYPE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.3
-- Production: subtype_declaration ::= subtype identifier is subtype_indication ;
-- Case Type: Negative
-- Test Focus: subtype_declaration: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity subtype_declara_e3 is end entity;
architecture bh of subtype_declara_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;