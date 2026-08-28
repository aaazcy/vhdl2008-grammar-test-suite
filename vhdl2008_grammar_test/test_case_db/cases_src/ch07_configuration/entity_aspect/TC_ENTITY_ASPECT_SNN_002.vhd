-- =============================================================
-- Case ID: TC_ENTITY_ASPECT_SNN_002
-- Rule Type: Syntax (Negative)
-- BNF Production: ENTITY_ASPECT
-- Standard Reference: IEEE 1076-2008 Section 7.3.3
-- Production: entity_aspect ::= entity entity_name [ ( architecture_identifier ) ] | configuration configuration_name | open
-- Case Type: Negative
-- Test Focus: Missing "entity" keyword in entity form — "use work.gate_and(rtl)" without "entity" is not valid entity_aspect; the "entity" keyword is required for the first alternative
-- Expected Result: Triggers syntax error (missing "entity" keyword)
-- Dependencies: None
-- =============================================================
entity easp_missing_entity_kw is
  port(a,b : in bit; y : out bit);
end entity;

architecture bh of easp_missing_entity_kw is
  component gate_and is
    port(x1,x2 : in bit; z : out bit);
  end component;
  -- ERROR: "entity" keyword missing before entity_name
  for u_and : gate_and use work.gate_and(rtl)
    port map(x1=>a, x2=>b, z=>y);
begin
  u_and : gate_and port map(x1=>a, x2=>b, z=>y);
end architecture bh;
