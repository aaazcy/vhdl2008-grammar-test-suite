-- =============================================================
-- Case ID: TC_ENTITY_ASPECT_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_ASPECT
-- Standard Reference: IEEE 1076-2008 Section 3.4
-- Production: entity_aspect ::= entity entity_name [ ( architecture_identifier ) ] | configuration configuration_name | open
-- Case Type: Positive
-- Test Focus: Entity aspect three forms: entity+arch specification(use entity work.ent(rtl)) / configuration specification(use configuration work.cfg) / open(unbound), verifying all three forms of entity_aspect in a binding_indication
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity inv is
  port (x:in bit; z:out bit);
end entity inv;

architecture rtl of inv is
begin
end architecture rtl;

entity ea_ent is port(a:in bit; y:out bit); end entity;
architecture bh of ea_ent is
  component inv is port(x:in bit; z:out bit); end component;
  for u_inv:inv use entity work.inv(rtl);
  signal s:bit;
begin u_inv:inv port map(x=>a,z=>s); y<=s; end architecture bh;
