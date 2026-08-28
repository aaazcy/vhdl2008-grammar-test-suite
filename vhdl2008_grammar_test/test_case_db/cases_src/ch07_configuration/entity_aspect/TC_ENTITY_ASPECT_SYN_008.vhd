-- =============================================================
-- Case ID: TC_ENTITY_ASPECT_SYN_008
-- Rule Type: Syntax
-- BNF Production: ENTITY_ASPECT
-- Standard Reference: IEEE 1076-2008 Section 7.3.3
-- Production: entity_aspect ::= entity entity_name [ ( architecture_identifier ) ] | configuration configuration_name | open
-- Case Type: Positive
-- Test Focus: entity form of an entity aspect using a direct entity name (without a library prefix) - testing that entity_name can be the simple identifier "my_entity" without the "work." prefix
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity my_inverter is
  port(a,b,c : in bit; y1,y2,y3 : out bit);
end entity;

architecture rtl of my_inverter is
  component inv is
    port(a : in bit; y : out bit);
  end component;
  for u_inv1 : inv use entity my_inverter(rtl)
    port map(a=>a, b=>b, c=>c, y1=>y1, y2=>y2, y3=>y3);
  for u_inv2 : inv use entity my_inverter
    port map(a=>a, b=>b, c=>c, y1=>y1, y2=>y2, y3=>y3);
  for u_inv3 : inv use open;
begin
  u_inv1 : inv port map(a=>a, y=>y1);
  u_inv2 : inv port map(a=>b, y=>y2);
  u_inv3 : inv port map(a=>c, y=>y3);
end architecture rtl;
