-- =============================================================
-- Case ID: TC_PARAMETER_SPECIFICATION_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_PARAMETER_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 10.10
-- Production: parameter_specification ::= identifier in discrete_range
-- Case Type: Negative
-- Test Focus: SNN: missing identifier after for — `for in 0 to 7 loop` has in and range but no loop parameter identifier
-- Expected Result: Triggers syntax error: missing loop parameter identifier
-- Dependencies: None
-- =============================================================
entity ps_snn1_ent is port(y:out integer); end entity;
architecture bh of ps_snn1_ent is
begin
  process is
    variable v : integer := 0;
  begin
    for in 0 to 7 loop
      v := v + 1;
    end loop;
    y <= v;
    wait;
  end process;
end architecture bh;
