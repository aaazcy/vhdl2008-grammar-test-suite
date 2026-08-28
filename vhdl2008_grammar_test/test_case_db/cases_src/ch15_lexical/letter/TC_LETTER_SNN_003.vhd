-- =============================================================
-- Case ID: TC_LETTER_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_LETTER
-- Standard Reference: IEEE 1076-2008 Section 15.3
-- Production: letter ::= upper_case_letter | lower_case_letter
-- Case Type: Negative
-- Test Focus: letter: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity letter_e3 is end entity;
architecture bh of letter_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;