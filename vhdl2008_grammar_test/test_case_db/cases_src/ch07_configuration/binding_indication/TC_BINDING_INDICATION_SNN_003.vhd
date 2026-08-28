-- =============================================================
-- Case ID: TC_BINDING_INDICATION_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_BINDING_INDICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.2.1
-- Production: binding_indication ::= [ use entity_aspect ] [ generic_map_aspect ] [ port_map_aspect ]
-- Case Type: Negative
-- Test Focus: Invalid entity_aspect syntax within binding_indication — 'use entity' must be followed by a valid entity_name; using a bare keyword 'open' without 'use open' in the wrong position breaks the entity_aspect grammar
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity bind_ind_snn3_ent is port(r:out integer); end entity;
architecture bh of bind_ind_snn3_ent is
  component comp_test is port(x:in integer; y:out integer); end component;
  -- ERROR: invalid entity_aspect — missing entity name after 'use entity'
  for u_c : comp_test use entity;
  signal s_v : integer := 0;
begin
  u_c : comp_test port map(x=>s_v, y=>r);
end architecture bh;
