-- =============================================================
-- Case ID: TC_PARAMETER_SPECIFICATION_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_PARAMETER_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 10.10
-- Production: parameter_specification ::= identifier in discrete_range
-- Case Type: Negative
-- Test Focus: SNN: missing 'in' keyword after for — `for i 0 to 7 loop` has identifier and range but is missing 'in'
-- Expected Result: Triggers syntax error: missing 'in' keyword
-- Dependencies: None
-- =============================================================
entity ps_snn2_ent is port(y:out integer); end entity;
architecture bh of ps_snn2_ent is
begin
  process is
    variable v : integer := 0;
  begin
    for i 0 to 7 loop
      v := v + i;
    end loop;
    y <= v;
    wait;
  end process;
end architecture bh;
