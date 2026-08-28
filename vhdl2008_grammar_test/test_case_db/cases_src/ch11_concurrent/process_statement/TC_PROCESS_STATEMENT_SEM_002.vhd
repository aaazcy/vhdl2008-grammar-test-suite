-- =============================================================
-- Case ID: TC_PROCESS_STATEMENT_SEM_002
-- Rule Type: Semantic
-- Related Rule ID: SEM_PROCESS_SIGNAL_DELTA
-- Standard Reference: IEEE 1076-2008 Section 11.3
-- Rule Description: Signal assignment inside a process schedules the new value but does not update the signal until the process suspends (delta-cycle semantics); a variable assignment takes effect immediately — this ordering difference is visible when a variable is assigned from a signal and then the signal is assigned from the variable in the same execution
-- Case Type: Positive
-- Error Category: none
-- Test Focus: Signal vs variable update timing within a single process execution — variable v_idx increments immediately and its new value is visible to the idx_out assignment in the same cycle, while s_cnt's signal assignment is scheduled and cnt_out reads the pre-increment value of s_cnt, verifying delta-cycle semantics of deferred signal updates versus immediate variable updates
-- Expected Result: Compiles successfully; idx_out reflects new v_idx, cnt_out reflects old s_cnt in same cycle
-- Dependencies: None
-- =============================================================
entity proc_sem2_ent is
  port(clk, inc : in bit; cnt_out, idx_out : out integer);
end entity proc_sem2_ent;
architecture bh of proc_sem2_ent is
  signal s_cnt : integer := 0;
begin
  process(clk)
    variable v_idx : integer := 0;
  begin
    if clk'event and clk = '1' then
      if inc = '1' then
        v_idx := v_idx + 1;
        s_cnt <= s_cnt + 1;
        idx_out <= v_idx;
        cnt_out <= s_cnt;
      end if;
    end if;
  end process;
end architecture bh;
