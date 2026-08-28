-- =============================================================
-- Case ID: TC_LETTER_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_LETTER
-- Standard Reference: IEEE 1076-2008 Section 15.3
-- Production: letter ::= upper_case_letter | lower_case_letter
-- Case Type: Negative
-- Test Focus: Special character as first character of an enumeration literal — enumeration values must start with letter, '_' is not a letter
-- Expected Result: Triggers error
-- Dependencies: None
-- =============================================================
entity let_snn_004 is
  port (
    val_out : out integer
  );
end entity let_snn_004;

architecture rtl of let_snn_004 is
  type T_BAD is (_Idle, Run, Stop);
  signal s_st : T_BAD := Run;
begin
  val_out <= 0;
end architecture rtl;
