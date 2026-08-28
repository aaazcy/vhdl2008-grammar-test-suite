-- =============================================================
-- Case ID: TC_BASIC_IDENTIFIER_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_BASIC_IDENTIFIER
-- Standard Reference: IEEE 1076-2008 Section 15.4.2
-- Production: basic_identifier ::= letter { [ underline ] letter_or_digit }
-- Case Type: Negative
-- Test Focus: basic_identifier starting with a double underscore(__bad) — underline can only appear between letter_or_digit (as a separator), not as the first character; verify the parser rejects underscore-leading identifiers
-- Expected Result: Triggers syntax error on underscore-leading identifier
-- Dependencies: None
-- =============================================================
entity bid_leading_underscore is
  port (
    bad_val : out integer
  );
end entity bid_leading_underscore;

architecture rtl of bid_leading_underscore is
  signal _bad : integer := 0;
begin
  bad_val <= _bad;
end architecture rtl;
