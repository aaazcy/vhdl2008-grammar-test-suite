-- =============================================================
-- Case ID: TC_ENTITY_ASPECT_SNN_001
-- Rule Type: Syntax (Negative)
-- BNF Production: ENTITY_ASPECT
-- Standard Reference: IEEE 1076-2008 Section 7.3.3
-- Production: entity_aspect ::= entity entity_name [ ( architecture_identifier ) ] | configuration configuration_name | open
-- Case Type: Negative
-- Test Focus: Missing entity_name after the "entity" keyword - in "use entity(rtl)" the entity keyword is directly followed by parentheses instead of an entity name, violating the entity entity_name production
-- Expected Result: Triggers syntax error (missing entity_name after "entity" keyword)
-- Dependencies: None
-- =============================================================
entity easp_no_entity_name is
  port(a,b : in bit; y : out bit);
end entity;

architecture rtl of easp_no_entity_name is
  component gate_and is
    port(x1,x2 : in bit; z : out bit);
  end component;
  -- ERROR: entity_name missing after "entity" keyword
  for u_and : gate_and use entity (rtl)
    port map(x1=>a, x2=>b, z=>y);
begin
  u_and : gate_and port map(x1=>a, x2=>b, z=>y);
end architecture rtl;
