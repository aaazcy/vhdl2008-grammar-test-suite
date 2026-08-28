-- =============================================================
-- Case ID: TC_LETTER_SMN_3
-- Rule Type: Semantic
-- Related Rule ID: BNF_LETTER
-- Standard Reference: IEEE 1076-2008 Section 15.3
-- Production: letter ::= upper_case_letter | lower_case_letter
-- Case Type: Negative
-- Test Focus: Reserved word entity used as a signal name — reserved words are made of letters but cannot be used as ordinary identifiers, semantic check should reject it
-- Expected Result: Triggers error
-- Dependencies: None
-- =============================================================
entity let_sem_002 is
  port (
    val_out : out integer
  );
end entity let_sem_002;

architecture rtl of let_sem_002 is
  signal signal : integer := 0;
begin
  signal <= 5;
  val_out <= signal;
end architecture rtl;
