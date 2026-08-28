-- =============================================================
-- Case ID: TC_PROCESS_STATEMENT_PART_SYN_S01
-- Rule Type: Syntax
-- BNF Production: PROCESS_STATEMENT_PART
-- Standard Reference: IEEE 1076-2008 Section 11.3
-- Test Focus: Process statement part: {sequential_statement} — all sequential statements within process body
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_process_statement_part_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_process_statement_part_syn_s01 is
  signal s_psp:integer:=0;
begin
  p_psp:process is
    variable v:integer:=0;
  begin
    v:=v+1; s_psp<=v;
    if v>=5 then wait; end if;
  end process;
  r<=s_psp;end architecture bh;
