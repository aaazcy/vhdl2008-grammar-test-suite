-- =============================================================
-- Case ID: TC_SEM_CFG_001_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_CFG_001
-- Standard Reference: IEEE 1076-2008 Section 3.4
-- Production: configuration_declaration ::= configuration identifier of entity_name is configuration_declarative_part { verification_unit_binding_indication ; } block_configuration end [ configuration ] [ configuration_simple_name ] ;
-- Rule Description: The component name bound in a configuration must actually be instantiated in the corresponding architecture - binding a nonexistent instance label triggers an elaboration error
-- Case Type: Negative
-- Error Category: declaration_elaboration_error
-- Test Focus: Negative case: the configuration binds `for u_missing:inv` but the actual instantiation label in the architecture is `u_inv` rather than `u_missing`, verifying an error is triggered when the instantiation_label specified by the configuration finds no match in the architecture
-- Expected Result: Triggers semantic error: component instance not found for configuration binding
-- Dependencies: None
-- =============================================================
entity inv is
  port (x:in bit; z:out bit);
end entity inv;

architecture rtl of inv is
begin
end architecture rtl;

entity cfg_smn_ent is
  port(a:in bit; y:out bit);
end entity;
architecture rtl of cfg_smn_ent is
  component inv is port(x:in bit; z:out bit); end component;
  signal s:bit;
begin
  u_inv:inv port map(x=>a,z=>s); y<=s;
end architecture;
configuration cfg_bad of cfg_smn_ent is
  for rtl
    for u_missing:inv use entity work.inv(rtl);
  end for;
end configuration cfg_bad;
