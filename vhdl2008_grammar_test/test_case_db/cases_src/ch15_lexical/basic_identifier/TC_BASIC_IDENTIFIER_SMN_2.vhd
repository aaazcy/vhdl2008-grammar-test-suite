-- =============================================================
-- Case ID: TC_BASIC_IDENTIFIER_SMN_2
-- Rule Type: Semantic
-- Related Rule ID: BNF_BASIC_IDENTIFIER
-- Standard Reference: IEEE 1076-2008 Section 15.4.2
-- Production: basic_identifier ::= letter { [ underline ] letter_or_digit }
-- Case Type: Negative
-- Test Focus: basic_identifier conflicting with a VHDL reserved word(entity) — entity is a VHDL reserved keyword and cannot be used as a signal/variable identifier; verify semantic analysis detects the reserved-word-as-identifier conflict
-- Expected Result: Triggers semantic error on reserved word as identifier
-- Dependencies: None
-- =============================================================
entity bid_reserved_word is
  port (
    bad_val : out integer
  );
end entity bid_reserved_word;

architecture rtl of bid_reserved_word is
  signal entity : integer := 0;
begin
  bad_val <= entity;
end architecture rtl;
