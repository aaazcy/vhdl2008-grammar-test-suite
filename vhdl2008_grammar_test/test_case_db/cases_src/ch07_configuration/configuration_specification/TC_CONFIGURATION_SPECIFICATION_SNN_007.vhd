-- =============================================================
-- Case ID: TC_CONFIGURATION_SPECIFICATION_SNN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONFIGURATION_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.1
-- Production: configuration_specification ::= simple_configuration_specification | compound_configuration_specification
-- Case Type: Negative
-- Test Focus: Missing semicolon after "end for" in simple form — the simple_configuration_specification must end with "end for ;"; omitting the final semicolon makes the configuration statement incomplete
-- Expected Result: Triggers syntax error (missing semicolon after end for)
-- Dependencies: None
-- =============================================================
entity confspec_snn7_ent is port(r:out integer); end entity;
architecture bh of confspec_snn7_ent is
  component comp_x is port(x:in integer; y:out integer); end component;
  -- ERROR: missing semicolon after "end for"
  for u_x : comp_x use entity work.confspec_snn7_ent(bh)
    port map(x=>0, y=>r);
  end for
  signal s:integer:=0;
begin
  u_x : comp_x port map(x=>s, y=>r);
end architecture bh;
