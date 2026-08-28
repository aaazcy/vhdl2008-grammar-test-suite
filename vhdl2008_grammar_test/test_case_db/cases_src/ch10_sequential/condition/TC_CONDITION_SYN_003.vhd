-- =============================================================
-- Case ID: TC_CONDITION_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITION
-- Standard Reference: IEEE 1076-2008 Section 10.2
-- Production: condition ::= expression
-- Case Type: Positive
-- Test Focus: condition: boolean expression in wait until clause
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity condition_syn3_ent is port(clk:in bit; trigger:in bit; y:out integer); end entity;
architecture bh of condition_syn3_ent is
  signal s_cnt:integer:=0;
begin
  process is
  begin
    wait until clk='1' and trigger='1';
    s_cnt<=s_cnt+1;
    y<=s_cnt;
  end process;
end architecture bh;
