-- =============================================================
-- Case ID: TC_ENTITY_ASPECT_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_ASPECT
-- Standard Reference: IEEE 1076-2008 Section 7.3.3
-- Production: entity_aspect ::= entity entity_name [ ( architecture_identifier ) ] | configuration configuration_name | open
-- Case Type: Positive
-- Test Focus: Entity aspect with explicit architecture_identifier — exercises the optional "(architecture_identifier)" clause, binding to a specific architecture (beh) of the entity, combined with open for others
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity gate_xor is
  port (x1,x2 : in bit; z : out bit);
end entity gate_xor;

architecture beh of gate_xor is
begin
end architecture beh;

entity easp_arch_id is
  port(a,b,c,d : in bit; y1,y2 : out bit);
end entity;

architecture bh of easp_arch_id is
  component gate_xor is
    port(x1,x2 : in bit; z : out bit);
  end component;
  component gate_and is
    port(x1,x2 : in bit; z : out bit);
  end component;
  for u_xor1 : gate_xor use entity work.gate_xor(beh)
    port map(x1=>a, x2=>b, z=>y1);
  for others : gate_and use open;
begin
  u_xor1 : gate_xor port map(x1=>a, x2=>b, z=>y1);
  u_and1 : gate_and port map(x1=>c, x2=>d, z=>y2);
end architecture bh;
