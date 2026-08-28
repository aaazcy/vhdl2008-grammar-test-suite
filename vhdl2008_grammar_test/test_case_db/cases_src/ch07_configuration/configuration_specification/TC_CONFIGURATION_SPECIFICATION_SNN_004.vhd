-- =============================================================
-- Case ID: TC_CONFIGURATION_SPECIFICATION_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONFIGURATION_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.1
-- Production: configuration_specification ::= simple_configuration_specification | compound_configuration_specification
-- Case Type: Negative
-- Test Focus: Missing "for" keyword in simple_configuration_specification — the simple form must begin with "for component_specification"; omitting "for" breaks the configuration_specification grammar
-- Expected Result: Triggers syntax error (missing "for" keyword)
-- Dependencies: None
-- =============================================================
entity confspec_snn4_ent is port(r:out integer); end entity;
architecture bh of confspec_snn4_ent is
  component comp_x is port(x:in integer; y:out integer); end component;
  -- ERROR: missing "for" keyword at start
  u_x : comp_x use entity work.confspec_snn4_ent(bh)
    port map(x=>0, y=>r);
  end for;
  signal s:integer:=0;
begin
  u_x : comp_x port map(x=>s, y=>r);
end architecture bh;
