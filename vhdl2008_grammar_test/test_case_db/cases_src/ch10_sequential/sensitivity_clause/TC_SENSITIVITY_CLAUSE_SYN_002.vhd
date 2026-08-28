-- =============================================================
-- Case ID: TC_SENSITIVITY_CLAUSE_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_SENSITIVITY_CLAUSE
-- Standard Reference: IEEE 1076-2008 Section 10.2
-- Production: sensitivity_clause ::= on sensitivity_list
-- Case Type: Positive
-- Test Focus: Minimal wait on — `wait on clk` — a wait statement using a sensitivity_clause to monitor a single clock signal
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sc_syn2_ent is port(clk:in bit; y:out integer); end entity;
architecture bh of sc_syn2_ent is
  signal s_cnt : integer := 0;
begin
  process is
  begin
    wait on clk;
    if clk = '1' then
      s_cnt <= s_cnt + 1;
    end if;
    y <= s_cnt;
  end process;
end architecture bh;
