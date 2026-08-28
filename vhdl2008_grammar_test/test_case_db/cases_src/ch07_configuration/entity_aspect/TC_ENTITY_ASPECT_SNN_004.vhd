-- =============================================================
-- Case ID: TC_ENTITY_ASPECT_SNN_004
-- Rule Type: Syntax (Negative)
-- BNF Production: ENTITY_ASPECT
-- Standard Reference: IEEE 1076-2008 Section 7.3.3
-- Production: entity_aspect ::= entity entity_name [ ( architecture_identifier ) ] | configuration configuration_name | open
-- Case Type: Negative
-- Test Focus: Missing configuration_name after the "configuration" keyword - "use configuration" is directly followed by a port map with no configuration name, violating the syntax of the configuration form
-- Expected Result: Triggers syntax error (missing configuration_name)
-- Dependencies: None
-- =============================================================
entity easp_no_config_name is
  port(a,b : in bit; y : out bit);
end entity;

architecture rtl of easp_no_config_name is
  component gate_or is
    port(x1,x2 : in bit; z : out bit);
  end component;
  -- ERROR: configuration_name missing after "configuration" keyword
  for u_or : gate_or use configuration
    port map(x1=>a, x2=>b, z=>y);
begin
  u_or : gate_or port map(x1=>a, x2=>b, z=>y);
end architecture rtl;
