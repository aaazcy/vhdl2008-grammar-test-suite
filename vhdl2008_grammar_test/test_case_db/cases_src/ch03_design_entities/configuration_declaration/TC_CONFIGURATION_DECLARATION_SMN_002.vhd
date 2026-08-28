-- =============================================================
-- Case ID: TC_CONFIGURATION_DECLARATION_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: SEM_ELAB_002
-- Standard Reference: IEEE 1076-2008 Section 3.4
-- Production: configuration_declaration ::= configuration identifier of entity_name is configuration_declarative_part block_configuration end [ configuration ] [ configuration_simple_name ] ;
-- Case Type: Negative
-- Test Focus: use entity binding references a nonexistent entity: for...use entity work.nonexist_ent(rtl) in block_configuration specifies an entity name never declared, verifying an error is triggered when entity lookup fails during elaboration
-- Expected Result: Triggers semantic error: entity "nonexist_ent" not found in library "work"
-- Dependencies: None
-- =============================================================
entity cfg_badbind_ent is
  port(a:in bit; y:out bit);
end entity;
architecture rtl of cfg_badbind_ent is
  component inv is port(x:in bit; z:out bit); end component;
  signal s:bit;
begin
  u_inv:inv port map(x=>a,z=>s); y<=s;
end architecture;
-- ERROR: entity "nonexist_ent" not found in library work
configuration cfg_badbind of cfg_badbind_ent is
  for rtl
    for u_inv:inv use entity work.nonexist_ent(rtl);
  end for;
end configuration cfg_badbind;
