-- =============================================================
-- Case ID: TC_BINDING_INDICATION_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_BINDING_INDICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.2.1
-- Production: binding_indication ::= [ use entity_aspect ] [ generic_map_aspect ] [ port_map_aspect ]
-- Case Type: Negative
-- Test Focus: Missing semicolon after binding_indication in configuration_specification — the binding_indication must be followed by ';' when used in a configuration_specification; omitting the semicolon breaks the surrounding grammar
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity bi_snn4_ent is port(r:out integer); end entity;
architecture bh of bi_snn4_ent is
  component comp_x is port(x:in integer; y:out integer); end component;
  -- ERROR: missing semicolon after binding_indication
  for u_x : comp_x use entity work.bi_snn4_ent(bh)
    port map(x=>0, y=>r)
  signal s:integer:=0;
begin
  u_x : comp_x port map(x=>s, y=>r);
end architecture bh;
