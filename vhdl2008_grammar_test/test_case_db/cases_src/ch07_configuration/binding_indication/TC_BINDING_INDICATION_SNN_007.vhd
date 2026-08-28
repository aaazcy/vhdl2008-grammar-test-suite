-- =============================================================
-- Case ID: TC_BINDING_INDICATION_SNN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_BINDING_INDICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.2.1
-- Production: binding_indication ::= [ use entity_aspect ] [ generic_map_aspect ] [ port_map_aspect ]
-- Case Type: Negative
-- Test Focus: Entity_aspect with missing architecture name after dot — "use entity work.comp( )" where the architecture identifier is required but omitted, making the entity aspect malformed
-- Expected Result: Triggers syntax error (malformed entity_aspect)
-- Dependencies: None
-- =============================================================
entity comp_x is
  port (x:in integer; y:out integer);
end entity comp_x;

architecture rtl of comp_x is
begin
end architecture rtl;

entity bi_snn7_ent is port(r:out integer); end entity;
architecture bh of bi_snn7_ent is
  component comp_x is port(x:in integer; y:out integer); end component;
  -- ERROR: entity_aspect missing architecture name: "(" without architecture
  for u_x : comp_x use entity work.comp_x();
  signal s:integer:=0;
begin
  u_x : comp_x port map(x=>s, y=>r);
end architecture bh;
