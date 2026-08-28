-- =============================================================
-- Case ID: TC_CONDITION_CLAUSE_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITION_CLAUSE
-- Standard Reference: IEEE 1076-2008 Section 10.2
-- Production: condition_clause ::= until condition
-- Case Type: Positive
-- Test Focus: Combined wait with all three clauses - `wait on clk until en='1' for 50 ns` - sensitivity_clause + condition_clause + timeout_clause all three clauses used
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity cc_syn5_ent is port(clk,en:in bit; y:out integer); end entity;
architecture bh of cc_syn5_ent is
  signal s_out : integer := 0;
begin
  process is
  begin
    wait on clk until en = '1' for 50 ns;
    if en = '1' then
      s_out <= 1;
    else
      s_out <= 0;
    end if;
    y <= s_out;
  end process;
end architecture bh;
