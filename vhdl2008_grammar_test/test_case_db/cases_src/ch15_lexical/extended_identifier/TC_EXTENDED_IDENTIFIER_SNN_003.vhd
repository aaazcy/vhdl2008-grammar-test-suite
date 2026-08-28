-- =============================================================
-- Case ID: TC_EXTENDED_IDENTIFIER_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXTENDED_IDENTIFIER
-- Standard Reference: IEEE 1076-2008 Section 15.4.2
-- Production: extended_identifier ::= \ graphic_character { graphic_character } \
-- Case Type: Negative
-- Test Focus: extended_identifier: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity extended_identi_e3 is end entity;
architecture bh of extended_identi_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;