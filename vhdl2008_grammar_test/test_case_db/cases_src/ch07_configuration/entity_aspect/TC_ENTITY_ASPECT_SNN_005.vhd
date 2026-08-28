-- =============================================================
-- Case ID: TC_ENTITY_ASPECT_SNN_005
-- Rule Type: Syntax (Negative)
-- BNF Production: ENTITY_ASPECT
-- Standard Reference: IEEE 1076-2008 Section 7.3.3
-- Production: entity_aspect ::= entity entity_name [ ( architecture_identifier ) ] | configuration configuration_name | open
-- Case Type: Negative
-- Test Focus: configuration_name replaced by an illegal token in an entity aspect - in "configuration 123_number" the configuration name is a numeric literal instead of a legal identifier, expecting a syntax error
-- Expected Result: Triggers syntax error (invalid configuration_name: numeric literal not a valid identifier)
-- Dependencies: None
-- =============================================================
entity easp_bad_config_name is
  port(a,b : in bit; y : out bit);
end entity;

architecture rtl of easp_bad_config_name is
  component gate_nand is
    port(x1,x2 : in bit; z : out bit);
  end component;
  -- ERROR: "123" is not a valid configuration_name (identifier expected)
  for u_nand : gate_nand use configuration 123
    port map(x1=>a, x2=>b, z=>y);
begin
  u_nand : gate_nand port map(x1=>a, x2=>b, z=>y);
end architecture rtl;
