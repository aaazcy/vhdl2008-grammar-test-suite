-- =============================================================
-- Case ID: TC_SENSITIVITY_CLAUSE_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_SENSITIVITY_CLAUSE
-- Standard Reference: IEEE 1076-2008 Section 10.2
-- Production: sensitivity_clause ::= on sensitivity_list
-- Case Type: Positive
-- Test Focus: wait on followed by loop — `wait on rst until rst='1'` — a wait statement containing sensitivity_clause + condition_clause, the two clauses coexisting
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sc_syn4_ent is port(rst,clk:in bit; y:out integer); end entity;
architecture bh of sc_syn4_ent is
  signal s_cnt : integer := 0;
begin
  process is
  begin
    wait on rst until rst = '1';
    s_cnt <= 0;
    wait on clk;
    if clk = '1' then
      s_cnt <= s_cnt + 1;
    end if;
    y <= s_cnt;
  end process;
end architecture bh;
