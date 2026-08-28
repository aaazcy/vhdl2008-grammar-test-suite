-- =============================================================
-- Case ID: TC_ALIAS_DECLARATION_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_ALIAS_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.6.1
-- Production: alias_declaration ::= alias alias_designator [ : subtype_indication ] is name [ signature ] ;
-- Case Type: Negative
-- Test Focus: alias_declaration: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity alias_declarati_e3 is end entity;
architecture bh of alias_declarati_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;