-- =============================================================
-- Case ID: TC_CONFIGURATION_DECLARATION_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONFIGURATION_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 3.4
-- Production: configuration_declaration ::= configuration identifier of entity_name is configuration_declarative_part block_configuration end [ configuration ] [ configuration_simple_name ] ;
-- Case Type: Negative
-- Test Focus: Nonexistent entity_name referenced after "of": the of clause of the configuration specifies the never-declared entity identifier nonexistent_entity, verifying an error is triggered when the parser expects a legal entity_name after of but encounters an undeclared identifier
-- Expected Result: Triggers semantic error: entity "nonexistent_entity" not found
-- Dependencies: None
-- =============================================================
entity inv is
  port (x:in bit; z:out bit);
end entity inv;

architecture rtl of inv is
begin
end architecture rtl;

entity cfg_ent_real is
  port(a:in bit; y:out bit);
end entity;
architecture rtl of cfg_ent_real is
  component inv is port(x:in bit; z:out bit); end component;
  signal s:bit;
begin
  u_inv:inv port map(x=>a,z=>s); y<=s;
end architecture;
-- ERROR: nonexistent_entity not declared
configuration cfg_noent of nonexistent_entity is
  for rtl
    for u_inv:inv use entity work.inv(rtl);
  end for;
end configuration cfg_noent;
