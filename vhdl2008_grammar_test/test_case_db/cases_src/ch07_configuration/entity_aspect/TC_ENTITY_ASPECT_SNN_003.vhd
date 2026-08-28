-- =============================================================
-- Case ID: TC_ENTITY_ASPECT_SNN_003
-- Rule Type: Syntax (Negative)
-- BNF Production: ENTITY_ASPECT
-- Standard Reference: IEEE 1076-2008 Section 7.3.3
-- Production: entity_aspect ::= entity entity_name [ ( architecture_identifier ) ] | configuration configuration_name | open
-- Case Type: Negative
-- Test Focus: Invalid keyword instead of "open" — "use closed" is not a valid entity_aspect; only "entity", "configuration", or "open" are permitted
-- Expected Result: Triggers syntax error (unrecognized keyword)
-- Dependencies: None
-- =============================================================
entity easp_invalid_keyword is
  port(a,b : in bit; y : out bit);
end entity;

architecture bh of easp_invalid_keyword is
  component gate_nor is
    port(x1,x2 : in bit; z : out bit);
  end component;
  -- ERROR: "closed" is not a valid entity_aspect keyword
  for all : gate_nor use closed;
begin
  u_nor : gate_nor port map(x1=>a, x2=>b, z=>y);
end architecture bh;
