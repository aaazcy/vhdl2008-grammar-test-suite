-- =============================================================
-- Case ID: TC_LETTER_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_LETTER
-- Standard Reference: IEEE 1076-2008 Section 15.3
-- Production: letter ::= upper_case_letter | lower_case_letter
-- Case Type: Negative
-- Test Focus: Digit as first character of an identifier — identifiers must start with letter, a digit is not a letter, violating VHDL identifier rules
-- Expected Result: Triggers error
-- Dependencies: None
-- =============================================================
entity let_snn_001 is
  port (
    val_out : out integer
  );
end entity let_snn_001;

architecture rtl of let_snn_001 is
  signal 1bad : integer := 0;
begin
  1bad    <= 5;
  val_out <= 1bad;
end architecture rtl;
