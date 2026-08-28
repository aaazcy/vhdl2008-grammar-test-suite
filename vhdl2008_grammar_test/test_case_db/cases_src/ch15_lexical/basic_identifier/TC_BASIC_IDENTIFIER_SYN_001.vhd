-- =============================================================
-- Case ID: TC_BASIC_IDENTIFIER_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_BASIC_IDENTIFIER
-- Standard Reference: IEEE 1076-2008 Section 15.4.2
-- Production: basic_identifier ::= letter { [ underline ] letter_or_digit }
-- Case Type: Positive
-- Test Focus: basic_identifier shortest form — a single letter('A') as a signal name, verify a single-letter identifier as the legal minimal length of a basic identifier
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity bid_single_letter is
  port (
    y : out integer
  );
end entity bid_single_letter;

architecture rtl of bid_single_letter is
  signal A : integer := 42;
begin
  y <= A;
end architecture rtl;
