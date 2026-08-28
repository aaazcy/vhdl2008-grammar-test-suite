-- =============================================================
-- Case ID: TC_CONFIGURATION_DECLARATION_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONFIGURATION_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 3.4
-- Production: configuration_declaration ::= configuration identifier of entity_name is configuration_declarative_part block_configuration end [ configuration ] [ configuration_simple_name ] ;
-- Case Type: Negative
-- Test Focus: Missing "is" keyword: in configuration_declaration the declarative part is written directly after entity_name, omitting the required "is" keyword, verifying the parser triggers a syntax error when it expects "is" after entity_name but encounters a following token
-- Expected Result: Triggers syntax error: missing "is" after entity_name
-- Dependencies: None
-- =============================================================
entity inv is
  port (x:in bit; z:out bit);
end entity inv;

architecture rtl of inv is
begin
end architecture rtl;

entity cfg_nois_ent is
  port(a:in bit; y:out bit);
end entity;
architecture rtl of cfg_nois_ent is
  component inv is port(x:in bit; z:out bit); end component;
  signal s:bit;
begin
  u_inv:inv port map(x=>a,z=>s); y<=s;
end architecture;
-- ERROR: missing "is" after entity_name
configuration cfg_nois of cfg_nois_ent
  for rtl
    for u_inv:inv use entity work.inv(rtl);
  end for;
end configuration cfg_nois;
