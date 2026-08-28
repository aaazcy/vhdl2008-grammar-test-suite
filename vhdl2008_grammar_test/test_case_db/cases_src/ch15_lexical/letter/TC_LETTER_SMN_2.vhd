-- =============================================================
-- Case ID: TC_LETTER_SMN_2
-- Rule Type: Semantic
-- Related Rule ID: BNF_LETTER
-- Standard Reference: IEEE 1076-2008 Section 15.3
-- Production: letter ::= upper_case_letter | lower_case_letter
-- Case Type: Negative
-- Test Focus: Uppercase/lowercase letters in identifiers — VHDL identifiers are case insensitive, MySig and mysig are semantically the same identifier causing duplicate declaration
-- Expected Result: Triggers error
-- Dependencies: None
-- =============================================================
entity let_sem_001 is
  port (
    val_out : out integer
  );
end entity let_sem_001;

architecture rtl of let_sem_001 is
  signal MySig : integer := 5;
  signal mysig : integer := 10;
begin
  val_out <= MySig;
end architecture rtl;
