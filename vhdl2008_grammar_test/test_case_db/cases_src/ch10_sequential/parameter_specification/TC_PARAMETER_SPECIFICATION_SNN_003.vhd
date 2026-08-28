-- =============================================================
-- Case ID: TC_PARAMETER_SPECIFICATION_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_PARAMETER_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 10.10
-- Production: parameter_specification ::= identifier in discrete_range
-- Case Type: Negative
-- Test Focus: SNN: missing discrete_range — `for i in loop` has identifier and in but no range
-- Expected Result: Triggers syntax error: missing discrete_range after 'in'
-- Dependencies: None
-- =============================================================
entity ps_snn3_ent is port(y:out integer); end entity;
architecture bh of ps_snn3_ent is
begin
  process is
    variable v : integer := 0;
  begin
    for i in loop
      v := v + 1;
    end loop;
    y <= v;
    wait;
  end process;
end architecture bh;
