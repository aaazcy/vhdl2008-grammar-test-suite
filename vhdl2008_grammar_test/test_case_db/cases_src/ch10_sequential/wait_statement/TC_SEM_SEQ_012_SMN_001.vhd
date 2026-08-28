-- =============================================================
-- Case ID: TC_SEM_SEQ_012_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_SEQ_012
-- Standard Reference: IEEE 1076-2008 Section 10.2
-- Rule Description: WAIT statement is not permitted inside a process with a sensitivity list
-- Case Type: Negative
-- Error Category: scope_visibility_error
-- Test Focus: WAIT used in process that has a sensitivity list
-- Expected Result: Triggers semantic error: scope_visibility_error
-- Dependencies: None
-- =============================================================
entity tc_sem_seq_012_smn_001 is port(r:out integer); end entity;
architecture bh of tc_sem_seq_012_smn_001 is
  signal s_clk : bit := '0';
  signal s_cnt : integer := 0;
  signal s_val : integer := 0;
begin
  -- Process with sensitivity list
  process(s_clk) is
  begin
    s_cnt <= s_cnt + 1;
    -- ERROR: WAIT not allowed in process with sensitivity list
    wait for 10 ns;
    s_val <= s_cnt;
  end process;
  r <= s_val;
end architecture bh;
