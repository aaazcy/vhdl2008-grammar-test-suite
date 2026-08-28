-- =============================================================
-- Case ID: TC_BASIC_IDENTIFIER_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_BASIC_IDENTIFIER
-- Standard Reference: IEEE 1076-2008 Section 15.4.2
-- Production: basic_identifier ::= letter { [ underline ] letter_or_digit }
-- Case Type: Negative
-- Test Focus: basic_identifier starting with a digit(1signal) — BNF requires identifiers to start with a letter, digits cannot be the first character of a basic_identifier; verify the lexical analyzer rejects digit-leading identifiers
-- Expected Result: Triggers syntax error on digit-leading identifier
-- Dependencies: None
-- =============================================================
entity bid_leading_digit is
  port (
    bad_val : out integer
  );
end entity bid_leading_digit;

architecture rtl of bid_leading_digit is
  signal 1signal : integer := 0;
begin
  bad_val <= 1signal;
end architecture rtl;
