-- =============================================================
-- Case ID: TC_BINDING_INDICATION_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: BNF_BINDING_INDICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.2.1
-- Production: binding_indication ::= [ use entity_aspect ] [ generic_map_aspect ] [ port_map_aspect ]
-- Case Type: Negative (Semantic)
-- Test Focus: Port map formal/actual count mismatch — the component has one port but the port_map_aspect lists two port associations; the number of actuals must match the number of formals
-- Expected Result: Triggers semantic error (port count mismatch)
-- Dependencies: None
-- =============================================================
entity bi_smn2_ent is port(r:out integer); end entity;
architecture bh of bi_smn2_ent is
  component comp_single is
    port(x : in integer);
  end component;
  -- ERROR: component has 1 port, port map lists 2 associations
  for u_s : comp_single use entity work.bi_smn2_ent(bh)
    port map(x=>0, y=>r);
  signal s:integer:=0;
begin
  u_s : comp_single port map(x=>s);
end architecture bh;
