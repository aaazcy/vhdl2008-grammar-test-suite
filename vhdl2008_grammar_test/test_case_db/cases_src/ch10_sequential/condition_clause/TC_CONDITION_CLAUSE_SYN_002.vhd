-- =============================================================
-- Case ID: TC_CONDITION_CLAUSE_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITION_CLAUSE
-- Standard Reference: IEEE 1076-2008 Section 10.2
-- Production: condition_clause ::= until condition
-- Case Type: Positive
-- Test Focus: wait until with a compound condition - `until rst='1' or s_cnt>10` - condition is an OR compound boolean expression
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity cc_syn2_ent is port(rst:in bit; y:out integer); end entity;
architecture bh of cc_syn2_ent is
  signal s_cnt : integer := 0;
begin
  process is
  begin
    wait until rst = '1' or s_cnt > 10;
    if rst = '1' then s_cnt <= 0; end if;
    y <= s_cnt;
    s_cnt <= s_cnt + 1;
  end process;
end architecture bh;
