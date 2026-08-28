-- =============================================================
-- Case ID: TC_CONFIGURATION_DECLARATION_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONFIGURATION_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 3.4
-- Production: configuration_declaration ::= configuration identifier of entity_name is configuration_declarative_part block_configuration end [ configuration ] [ configuration_simple_name ] ;
-- Case Type: Negative
-- Test Focus: Missing "of" keyword: entity_name is written directly after the configuration identifier, omitting the keyword "of", verifying the parser triggers a syntax error when it expects "of" after configuration_simple_name but encounters the entity_name identifier
-- Expected Result: Triggers syntax error: missing "of" after configuration identifier
-- Dependencies: None
-- =============================================================
entity inv is
  port (x:in bit; z:out bit);
end entity inv;

architecture rtl of inv is
begin
end architecture rtl;

entity cfg_noof_ent is
  port(a:in bit; y:out bit);
end entity;
architecture rtl of cfg_noof_ent is
  component inv is port(x:in bit; z:out bit); end component;
  signal s:bit;
begin
  u_inv:inv port map(x=>a,z=>s); y<=s;
end architecture;
-- ERROR: missing "of" after cfg_noof
configuration cfg_noof cfg_noof_ent is
  for rtl
    for u_inv:inv use entity work.inv(rtl);
  end for;
end configuration cfg_noof;
