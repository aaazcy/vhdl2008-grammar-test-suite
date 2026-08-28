-- =============================================================
-- Case ID: TC_SEM_2008_011_SMN_003
-- Rule Type: Semantic
-- Related Rule ID: SEM_2008_011
-- Standard Reference: IEEE 1076-2008 Section 11.8
-- Rule Description: Case generate alternatives must cover all possible values of the expression type
-- Case Type: Negative
-- Error Category: declaration_elaboration_error
-- Test Focus: Case generate with incomplete coverage of expression type values
-- Expected Result: Triggers semantic error: declaration_elaboration_error
-- Dependencies: None
-- =============================================================
entity tc_sem_2008_011_smn_003 is port(r:out integer); end entity;
architecture bh of tc_sem_2008_011_smn_003 is
  signal s_val : integer := 1;
  signal s_out1, s_out2, s_out3 : integer := 0;
begin
  -- ERROR: case generate only covers 1 and 2, missing 0
  gen_case: for i in 0 to 2 generate
    case i generate
      when 1 => s_out1 <= s_val;
      when 2 => s_out2 <= s_val;
      -- 0 is missing
    end generate;
  end generate;
  r <= s_out1 + s_out2 + s_out3;
end architecture bh;
