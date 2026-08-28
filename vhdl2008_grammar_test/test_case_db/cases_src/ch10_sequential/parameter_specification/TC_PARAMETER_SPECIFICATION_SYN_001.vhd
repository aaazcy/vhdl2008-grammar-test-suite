-- =============================================================
-- Case ID: TC_PARAMETER_SPECIFICATION_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_PARAMETER_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 10.10
-- Production: parameter_specification ::= identifier in discrete_range
-- Case Type: Positive
-- Test Focus: Minimal parameter_specification: `for i in 0 to 7 loop` — identifier `i` iterates over integer range 0 to 7
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ps_syn1_ent is port(y:out integer); end entity;
architecture bh of ps_syn1_ent is
begin
  process is
    variable v : integer := 0;
  begin
    for i in 0 to 7 loop
      v := v + i;
    end loop;
    y <= v;
    wait;
  end process;
end architecture bh;
