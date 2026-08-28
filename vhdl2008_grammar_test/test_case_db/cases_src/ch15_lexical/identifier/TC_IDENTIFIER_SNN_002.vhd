-- =============================================================
-- Case ID: TC_IDENTIFIER_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_IDENTIFIER
-- Standard Reference: IEEE 1076-2008 Section 15.4.2
-- Production: identifier ::= basic_identifier | extended_identifier
-- Case Type: Negative
-- Test Focus: identifier: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity identifier_e2 is end entity;
architecture bh of identifier_e2 is
  -- ERROR: invalid syntax in identifier
  signal s : bit;
begin
  s <= '1'
end architecture bh;