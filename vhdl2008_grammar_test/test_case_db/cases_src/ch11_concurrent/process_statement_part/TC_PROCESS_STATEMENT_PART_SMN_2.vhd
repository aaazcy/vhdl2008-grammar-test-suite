-- =============================================================
-- Case ID: TC_PROCESS_STATEMENT_PART_SMN_2
-- Rule Type: Semantic
-- Related Rule ID: SEM_PROC_STMT_WAIT
-- Standard Reference: IEEE 1076-2008 Section 11.3
-- Rule Description: Process with sensitivity list cannot contain wait statements
-- Case Type: Negative
-- Error Category: syntax_error
-- Test Focus: SEM: wait statement in process with sensitivity list
-- Expected Result: Triggers semantic error: wait in process with sensitivity list
-- Dependencies: None
-- =============================================================
entity proc_stmt_sem1_ent is port(clk:in bit; y:out integer); end entity;
architecture bh of proc_stmt_sem1_ent is
  signal s_cnt:integer:=0;
begin
  process(clk) is
  begin
    s_cnt<=s_cnt+1;
    wait for 1 ns;
    y<=s_cnt;
  end process;
end architecture bh;
