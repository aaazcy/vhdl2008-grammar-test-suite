-- =============================================================
-- Case ID: TC_BASIC_IDENTIFIER_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: BNF_BASIC_IDENTIFIER
-- Standard Reference: IEEE 1076-2008 Section 15.4.2
-- Production: basic_identifier ::= letter { [ underline ] letter_or_digit }
-- Case Type: Negative
-- Test Focus: duplicate declaration of basic_identifier(my_signal declared twice) — two signals in the same declarative region use the same basic_identifier, violating the identifier uniqueness semantic rule
-- Expected Result: Triggers semantic error on duplicate identifier
-- Dependencies: None
-- =============================================================
entity bid_duplicate_name is
  port (
    bad_val : out integer
  );
end entity bid_duplicate_name;

architecture rtl of bid_duplicate_name is
  signal my_signal : integer := 0;
  signal my_signal : integer := 1;
begin
  bad_val <= my_signal;
end architecture rtl;
