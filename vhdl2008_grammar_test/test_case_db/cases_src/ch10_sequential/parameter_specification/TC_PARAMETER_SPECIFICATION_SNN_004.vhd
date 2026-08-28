-- =============================================================
-- Case ID: TC_PARAMETER_SPECIFICATION_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_PARAMETER_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 10.10
-- Production: parameter_specification ::= identifier in discrete_range
-- Case Type: Negative
-- Test Focus: SNN: range bound mismatch — `for i in 0 to '1' loop` — integer low and bit high types are incompatible
-- Expected Result: Triggers semantic error: range bounds must have same discrete type
-- Dependencies: None
-- =============================================================
entity ps_snn4_ent is port(y:out integer); end entity;
architecture bh of ps_snn4_ent is
begin
  process is
    variable v : integer := 0;
  begin
    for i in 0 to '1' loop
      v := v + 1;
    end loop;
    y <= v;
    wait;
  end process;
end architecture bh;
