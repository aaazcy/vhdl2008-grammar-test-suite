-- =============================================================
-- Case ID: TC_PRIMARY_UNIT_DECLARATION_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_PRIMARY_UNIT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: primary_unit_declaration ::= identifier ;
-- Case Type: Negative
-- Test Focus: primary_unit_declaration: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity primary_unit_de_e3 is end entity;
architecture bh of primary_unit_de_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;