-- =============================================================
-- Case ID: TC_BINDING_INDICATION_SNN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_BINDING_INDICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.2.1
-- Production: binding_indication ::= [ use entity_aspect ] [ generic_map_aspect ] [ port_map_aspect ]
-- Case Type: Negative
-- Test Focus: Invalid generic_map_aspect syntax — generic map must use 'generic map' keyword pair, using just 'generic' without 'map' violates the generic_map_aspect grammar within binding_indication
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity bi_snn6_ent is port(r:out integer); end entity;
architecture bh of bi_snn6_ent is
  component comp_x is generic(N:integer:=4); port(x:in integer; y:out integer); end component;
  -- ERROR: 'generic' without 'map' keyword
  for u_x : comp_x use entity work.bi_snn6_ent(bh)
    generic(N => 8) port map(x=>0, y=>r);
  signal s:integer:=0;
begin
  u_x : comp_x port map(x=>s, y=>r);
end architecture bh;
