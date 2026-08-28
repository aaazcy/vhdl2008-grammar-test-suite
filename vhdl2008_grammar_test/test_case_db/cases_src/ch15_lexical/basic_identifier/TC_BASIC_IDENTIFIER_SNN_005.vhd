-- =============================================================
-- Case ID: TC_BASIC_IDENTIFIER_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_BASIC_IDENTIFIER
-- Standard Reference: IEEE 1076-2008 Section 15.4.2
-- Production: basic_identifier ::= letter { [ underline ] letter_or_digit }
-- Case Type: Negative
-- Test Focus: basic_identifier ending with a trailing underscore(signal_) — underline must be followed by letter_or_digit, a trailing underscore violates the { [ underline ] letter_or_digit } repetition rule in the BNF
-- Expected Result: Triggers syntax error on trailing underscore in identifier
-- Dependencies: None
-- =============================================================
entity bid_trailing_underscore is
  port (
    bad_val : out integer
  );
end entity bid_trailing_underscore;

architecture rtl of bid_trailing_underscore is
  signal bad_signal_ : integer := 0;
begin
  bad_val <= bad_signal_;
end architecture rtl;
