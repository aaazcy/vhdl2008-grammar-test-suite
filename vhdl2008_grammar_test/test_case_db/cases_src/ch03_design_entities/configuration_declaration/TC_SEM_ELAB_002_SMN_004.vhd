-- =============================================================
-- Case ID: TC_SEM_ELAB_002_SMN_004
-- Rule Type: Semantic
-- Related Rule ID: SEM_ELAB_002
-- Standard Reference: IEEE 1076-2008 Section 3.4
-- Production: configuration_declaration ::= configuration identifier of entity_name is configuration_declarative_part block_configuration end [ configuration ] [ configuration_simple_name ] ;
-- Case Type: Negative
-- Test Focus: Duplicate configuration identifier: two configurations with the same name (cfg_dup) are declared in the same analysis unit, verifying the duplicate declaration triggers an identifier redefinition error
-- Expected Result: Triggers semantic error: duplicate configuration identifier
-- Dependencies: None
-- =============================================================
entity inv is
  port (x:in bit; z:out bit);
end entity inv;

architecture rtl of inv is
begin
end architecture rtl;

entity cfg_dup_ent is
  port(a:in bit; y:out bit);
end entity;
architecture rtl of cfg_dup_ent is
  component inv is port(x:in bit; z:out bit); end component;
  signal s:bit;
begin
  u_inv:inv port map(x=>a,z=>s); y<=s;
end architecture;
configuration cfg_dup of cfg_dup_ent is
  for rtl
    for u_inv:inv use entity work.inv(rtl);
  end for;
end configuration cfg_dup;
-- ERROR: duplicate configuration name cfg_dup
configuration cfg_dup of cfg_dup_ent is
  for rtl
    for u_inv:inv use entity work.inv(rtl);
  end for;
end configuration cfg_dup;
