-- =============================================================
-- Case ID: TC_BASIC_IDENTIFIER_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_BASIC_IDENTIFIER
-- Standard Reference: IEEE 1076-2008 Section 15.4.2
-- Production: basic_identifier ::= letter { [ underline ] letter_or_digit }
-- Case Type: Negative
-- Test Focus: SMN: reserved word in the basic_identifier position — in signal signal the second signal is a reserved word, reserved words cannot be used as basic_identifier
-- Expected Result: Triggers analysis error: an identifier is expected instead of 'signal'
-- Dependencies: None
-- =============================================================
entity bid_reserved_word is
  port (
    bad_val : out integer
  );
end entity bid_reserved_word;

architecture vhdl2008 of bid_reserved_word is
  signal signal : integer;
begin
  bad_val <= 0;
end architecture vhdl2008;
