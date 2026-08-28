-- =============================================================
-- Case ID: TC_SEM_2008_011_SMN_004
-- Rule Type: Semantic
-- Related Rule ID: SEM_2008_011
-- Standard Reference: IEEE 1076-2008 Section 11.8
-- Rule Description: Case generate alternatives must cover all possible values of the expression type
-- Case Type: Negative
-- Error Category: declaration_elaboration_error
-- Test Focus: Case generate with overlapping choices
-- Expected Result: Triggers semantic error: declaration_elaboration_error
-- Dependencies: None
-- =============================================================
entity tc_sem_2008_011_smn_004 is port(r:out integer); end entity;
architecture bh of tc_sem_2008_011_smn_004 is
  signal s_val : integer := 1;
  signal s_a, s_b, s_c : integer := 0;
begin
  -- ERROR: case generate choice 1 appears twice
  gen_case2: for i in 1 to 2 generate
    case i generate
      when 1 => s_a <= s_val;
      when 1 => s_b <= s_val;  -- duplicate choice
      when 2 => s_c <= s_val;
    end generate;
  end generate;
  r <= s_a + s_b + s_c;
end architecture bh;
