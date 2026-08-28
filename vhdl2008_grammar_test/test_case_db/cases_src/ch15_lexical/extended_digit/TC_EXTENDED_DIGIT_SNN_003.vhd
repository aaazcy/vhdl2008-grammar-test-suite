-- =============================================================
-- Case ID: TC_EXTENDED_DIGIT_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXTENDED_DIGIT
-- Standard Reference: IEEE 1076-2008 Section 15.5.3
-- Production: extended_digit ::= digit | letter
-- Case Type: Negative
-- Test Focus: extended_digit: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity extended_digit_e3 is end entity;
architecture bh of extended_digit_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;