-- =============================================================
-- Case ID: TC_PROCESS_SENSITIVITY_LIST_SMN_2
-- Rule Type: Semantic
-- Related Rule ID: SEM_PROC_SENS_ALL
-- Standard Reference: IEEE 1076-2008 Section 11.3
-- Rule Description: Process with 'all' sensitivity list cannot have wait statements
-- Case Type: Negative
-- Error Category: syntax_error
-- Test Focus: SEM: process with all sensitivity and explicit wait statement
-- Expected Result: Triggers semantic error: wait not allowed with sensitivity list
-- Dependencies: None
-- =============================================================
entity proc_sens_sem1_ent is port(a:in bit; y:out integer); end entity;
architecture bh of proc_sens_sem1_ent is
  signal s_cnt:integer:=0;
begin
  process(all) is
  begin
    s_cnt<=s_cnt+1;
    wait on a;
    y<=s_cnt;
  end process;
end architecture bh;
