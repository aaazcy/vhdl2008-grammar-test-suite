-- =============================================================
-- Case ID: TC_ENUMERATION_LITERAL_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENUMERATION_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 5.2.2.1
-- Production: enumeration_literal ::= identifier | character_literal
-- Case Type: Negative
-- Test Focus: enumeration_literal: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity enumeration_lit_e3 is end entity;
architecture bh of enumeration_lit_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;