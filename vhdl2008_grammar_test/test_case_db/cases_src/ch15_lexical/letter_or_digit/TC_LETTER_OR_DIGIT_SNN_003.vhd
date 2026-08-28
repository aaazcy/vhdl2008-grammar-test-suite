-- =============================================================
-- Case ID: TC_LETTER_OR_DIGIT_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_LETTER_OR_DIGIT
-- Standard Reference: IEEE 1076-2008 Section 15.3
-- Production: letter_or_digit ::= letter | digit
-- Case Type: Negative
-- Test Focus: letter_or_digit: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity letter_or_digit_e3 is end entity;
architecture bh of letter_or_digit_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;