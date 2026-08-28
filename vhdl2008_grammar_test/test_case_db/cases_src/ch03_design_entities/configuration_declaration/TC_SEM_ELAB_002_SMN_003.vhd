-- =============================================================
-- Case ID: TC_SEM_ELAB_002_SMN_003
-- Rule Type: Semantic
-- Related Rule ID: SEM_ELAB_002
-- Standard Reference: IEEE 1076-2008 Section 3.4
-- Production: configuration_declaration ::= configuration identifier of entity_name is configuration_declarative_part block_configuration end [ configuration ] [ configuration_simple_name ] ;
-- Case Type: Negative
-- Test Focus: for clause in block_configuration references a nonexistent architecture name: the configuration binds for rtl but the target entity only has a beh architecture, verifying an error is triggered when architecture name lookup fails during elaboration
-- Expected Result: Triggers semantic error: architecture "rtl" not found for entity
-- Dependencies: None
-- =============================================================
entity inv is
  port (x:in bit; z:out bit);
end entity inv;

architecture rtl of inv is
begin
end architecture rtl;

entity cfg_bad_arch_ent is
  port(a:in bit; y:out bit);
end entity;
architecture beh of cfg_bad_arch_ent is
  component inv is port(x:in bit; z:out bit); end component;
  signal s:bit;
begin
  u_inv:inv port map(x=>a,z=>s); y<=s;
end architecture;
-- ERROR: architecture "rtl" does not exist for cfg_bad_arch_ent
configuration cfg_bad_arch of cfg_bad_arch_ent is
  for rtl
    for u_inv:inv use entity work.inv(rtl);
  end for;
end configuration cfg_bad_arch;
