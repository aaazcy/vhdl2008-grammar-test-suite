-- =============================================================
-- Case ID: TC_CONFIGURATION_SPECIFICATION_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONFIGURATION_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.1
-- Production: configuration_specification ::= simple_configuration_specification | compound_configuration_specification
-- Case Type: Negative
-- Test Focus: entity_aspect missing entity name — "for u_x : comp_x use entity;" has no entity_name; the entity_aspect grammar requires at least an entity name when "use entity" is specified
-- Expected Result: Triggers syntax error (missing entity name)
-- Dependencies: None
-- =============================================================
entity confspec_snn5_ent is port(r:out integer); end entity;
architecture bh of confspec_snn5_ent is
  component comp_x is port(x:in integer; y:out integer); end component;
  -- ERROR: "use entity" without entity name
  for u_x : comp_x use entity;
  end for;
  signal s:integer:=0;
begin
  u_x : comp_x port map(x=>s, y=>r);
end architecture bh;
