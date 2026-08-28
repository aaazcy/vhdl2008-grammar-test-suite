-- =============================================================
-- Case ID: TC_LETTER_OR_DIGIT_SMN_2
-- Rule Type: Semantic
-- Related Rule ID: BNF_LETTER_OR_DIGIT
-- Standard Reference: IEEE 1076-2008 Section 15.3
-- Production: letter_or_digit ::= letter | digit
-- Case Type: Negative
-- Test Focus: Identifier starting with a digit — the first character must be letter (not letter_or_digit), digits may only be used in non-first positions
-- Expected Result: Triggers error
-- Dependencies: None
-- =============================================================
entity lod_sem_001 is
  port (
    val_out : out integer
  );
end entity lod_sem_001;

architecture rtl of lod_sem_001 is
  signal 3state : integer := 0;
begin
  3state  <= 5;
  val_out <= 3state;
end architecture rtl;
