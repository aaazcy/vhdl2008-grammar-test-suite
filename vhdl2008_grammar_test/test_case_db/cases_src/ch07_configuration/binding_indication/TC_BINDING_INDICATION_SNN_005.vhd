-- =============================================================
-- Case ID: TC_BINDING_INDICATION_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_BINDING_INDICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.2.1
-- Production: binding_indication ::= [ use entity_aspect ] [ generic_map_aspect ] [ port_map_aspect ]
-- Case Type: Negative
-- Test Focus: Port map clause without preceding entity_aspect clause — while the port_map_aspect is optional, using it without any entity binding reference creates an ambiguous or incomplete binding; the grammar requires entity_aspect when port/generic maps are present
-- Expected Result: Triggers syntax error (port map without entity binding)
-- Dependencies: None
-- =============================================================
entity bi_snn5_ent is port(r:out integer); end entity;
architecture bh of bi_snn5_ent is
  component comp_x is port(a:in integer; b:out integer); end component;
  -- ERROR: port map without entity_aspect — no 'use' clause
  for u_x : comp_x port map(a=>0, b=>r);
  signal s:integer:=0;
begin
  u_x : comp_x port map(a=>s, b=>r);
end architecture bh;
