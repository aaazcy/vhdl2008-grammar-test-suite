-- =============================================================
-- Case ID: TC_SENSITIVITY_CLAUSE_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_SENSITIVITY_CLAUSE
-- Standard Reference: IEEE 1076-2008 Section 10.2
-- Production: sensitivity_clause ::= on sensitivity_list
-- Case Type: Positive
-- Test Focus: Sensitivity clause wait on single signal + multiple signals: wait on clk (single signal) + wait on a,b (multiple signals comma-separated), verifying the two forms of sensitivity_clause in a wait statement
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sc_ent is port(clk,a,b:in bit; y:out integer); end entity;
architecture bh of sc_ent is signal s_cnt:integer:=0; signal s_tmp:integer:=0;
begin
  process is begin
    wait on clk; if clk='1' then s_cnt<=s_cnt+1; end if;
    wait on a,b; s_tmp<=s_cnt; y<=s_tmp;
  end process;
end architecture bh;
