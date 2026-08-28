-- =============================================================
-- Case ID: TC_PROCESS_STATEMENT_PART_SEM_002
-- Rule Type: Semantic
-- Related Rule ID: BNF_PROCESS_STATEMENT_PART
-- Standard Reference: IEEE 1076-2008 Section 11.3
-- Production: process_statement_part ::= { sequential_statement }
-- Rule Description: Statements within a process execute sequentially in the order written; variable assignments take effect immediately, while signal assignments are scheduled for the next delta cycle
-- Case Type: Positive
-- Test Focus: variable immediate effect vs signal delay——v_tmp is used by the next statement immediately after assignment, while s_out <= is scheduled to the next delta, verifying the difference between the immediate semantics of variables and the delayed semantics of signals
-- Expected Result: Compiles successfully; variable assignment takes immediate effect
-- Dependencies: None
-- =============================================================
entity psp_sem2_ent is
  port(clk : in bit; a, b : in integer; y : out integer);
end entity psp_sem2_ent;
architecture bh of psp_sem2_ent is
begin
  process(clk) is
    variable v_tmp : integer;
  begin
    if clk'event and clk = '1' then
      v_tmp := a + b;
      v_tmp := v_tmp * 2;
      y <= v_tmp;
    end if;
  end process;
end architecture bh;
