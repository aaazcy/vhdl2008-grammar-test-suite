-- =============================================================
-- Case ID: TC_IDENTIFIER_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_IDENTIFIER
-- Standard Reference: IEEE 1076-2008 Section 15.4.2
-- Production: identifier ::= basic_identifier | extended_identifier
-- Case Type: Negative
-- Test Focus: identifier: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity identifier_e3 is end entity;
architecture bh of identifier_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;