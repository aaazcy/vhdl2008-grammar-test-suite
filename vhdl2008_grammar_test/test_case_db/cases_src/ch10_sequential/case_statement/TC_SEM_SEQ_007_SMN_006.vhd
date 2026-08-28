-- =============================================================
-- Case ID: TC_SEM_SEQ_007_SMN_006
-- Rule Type: Semantic
-- Related Rule ID: SEM_SEQ_007
-- Standard Reference: IEEE 1076-2008 Section 10.9
-- Rule Description: Case statement choices must cover all possible values of the expression type
-- Case Type: Negative
-- Error Category: declaration_elaboration_error
-- Test Focus: Case with integer expression but only partial range coverage
-- Expected Result: Triggers semantic error: declaration_elaboration_error
-- Dependencies: None
-- =============================================================
entity tc_sem_seq_007_smn_006 is port(r:out integer); end entity;
architecture bh of tc_sem_seq_007_smn_006 is
  signal s_val : integer range 0 to 7 := 0;
  signal s_result : integer := 0;
begin
  -- ERROR: integer case with only 0-3 covered, 4-7 uncovered
  case s_val is
    when 0 => s_result <= 0;
    when 1 => s_result <= 10;
    when 2 => s_result <= 20;
    when 3 => s_result <= 30;
  end case;
  r <= s_result;
end architecture bh;
