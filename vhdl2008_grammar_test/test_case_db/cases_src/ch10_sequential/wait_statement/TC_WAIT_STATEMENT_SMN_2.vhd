-- =============================================================
-- Case ID: TC_WAIT_STATEMENT_SMN_2
-- Rule Type: Semantic
-- Related Rule ID: SEM_SEQ_012
-- Standard Reference: IEEE 1076-2008 Section 10.2
-- Rule Description: WAIT statement not permitted in process with sensitivity list
-- Case Type: Negative
-- Error Category: semantic_error
-- Test Focus: SEM: Using wait in a process with a sensitivity list — violates SEM_SEQ_012, a process with a signal sensitivity list must not contain a wait statement
-- Expected Result: Triggers semantic error: wait not allowed in process with sensitivity list
-- Dependencies: None
-- =============================================================
entity wait_in_sens_proc_ent is
  port (clk : in bit; result : out integer);
end entity wait_in_sens_proc_ent;

architecture sem of wait_in_sens_proc_ent is
  signal s_cnt : integer := 0;
begin
  process(clk) is  -- process has sensitivity list
  begin
    s_cnt <= s_cnt + 1;
    wait for 5 ns;  -- ERROR: wait not allowed in process with sensitivity list
  end process;
  result <= s_cnt;
end architecture sem;
