-- =============================================================
-- Case ID: TC_SEM_CFG_001_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_CFG_001
-- Standard Reference: IEEE 1076-2008 Section 3.4
-- Production: configuration_declaration ::= configuration identifier of entity_name is configuration_declarative_part { verification_unit_binding_indication ; } block_configuration end [ configuration ] [ configuration_simple_name ] ;
-- Rule Description: The component name bound in a configuration must have a corresponding instantiation in the corresponding architecture - compilation passes when the binding is correct
-- Case Type: Positive
-- Error Category: declaration_elaboration_error
-- Test Focus: Positive case: architecture rtl instantiates component inv, configuration cfg_ok correctly binds for u_inv:inv use entity work.inv(rtl), verifying elaboration succeeds when the configuration name matches the entity instance name
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity inv is
  port (x:in bit; z:out bit);
end entity inv;

architecture rtl of inv is
begin
end architecture rtl;

entity cfg_sem_ent is
  port(a:in bit; y:out bit);
end entity;
architecture rtl of cfg_sem_ent is
  component inv is port(x:in bit; z:out bit); end component;
  signal s:bit;
begin
  u_inv:inv port map(x=>a,z=>s); y<=s;
end architecture;
configuration cfg_ok of cfg_sem_ent is
  for rtl
    for u_inv:inv use entity work.inv(rtl);
  end for;
end configuration cfg_ok;
