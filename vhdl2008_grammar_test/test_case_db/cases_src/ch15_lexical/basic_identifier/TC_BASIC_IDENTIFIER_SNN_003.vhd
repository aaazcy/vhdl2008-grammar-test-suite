-- =============================================================
-- Case ID: TC_BASIC_IDENTIFIER_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_BASIC_IDENTIFIER
-- Standard Reference: IEEE 1076-2008 Section 15.4.2
-- Production: basic_identifier ::= letter { [ underline ] letter_or_digit }
-- Case Type: Negative
-- Test Focus: basic_identifier: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity basic_identifie_e3 is end entity;
architecture bh of basic_identifie_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;