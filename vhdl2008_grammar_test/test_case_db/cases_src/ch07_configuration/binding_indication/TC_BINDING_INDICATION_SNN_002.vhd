-- =============================================================
-- Case ID: TC_BINDING_INDICATION_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_BINDING_INDICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.2.1
-- Production: binding_indication ::= [ use entity_aspect ] [ generic_map_aspect ] [ port_map_aspect ]
-- Case Type: Negative
-- Test Focus: Missing 'use' keyword before entity_aspect — when entity_aspect is present in binding_indication, 'use' is required syntax; omitting it violates the production
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity bind_ind_snn2_ent is port(r:out integer); end entity;
architecture bh of bind_ind_snn2_ent is
  component comp_test is port(x:in integer; y:out integer); end component;
  -- ERROR: missing 'use' keyword before entity_aspect
  for u_c : comp_test entity work.bind_ind_snn2_ent(bh) port map(x=>0, y=>r);
  signal s_v : integer := 0;
begin
  u_c : comp_test port map(x=>s_v, y=>r);
end architecture bh;
