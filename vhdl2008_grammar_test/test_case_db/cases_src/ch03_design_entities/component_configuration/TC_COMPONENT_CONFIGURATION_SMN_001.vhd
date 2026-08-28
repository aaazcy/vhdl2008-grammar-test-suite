-- =============================================================
-- Case ID: TC_COMPONENT_CONFIGURATION_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_COMPONENT_CONFIGURATION
-- Standard Reference: IEEE 1076-2008 Section 3.4.3
-- Production: component_configuration ::= for component_specification [ binding_indication ] [ block_configuration ] end for ;
-- Case Type: Negative
-- Test Focus: binding_indication in component_configuration references a nonexistent entity: the design entity specified in use entity work.nonexistent(rtl) does not exist in the work library, verifying an entity name must reference a compiled design unit
-- Expected Result: Triggers semantic error on non-existent entity reference
-- Dependencies: None
-- =============================================================
entity ccfg_smn1_ent is
  port(a:in bit; y:out bit);
end entity;
architecture rtl of ccfg_smn1_ent is
  component inv is port(x:in bit; z:out bit); end component;
  signal s:bit;
begin
  u_inv:inv port map(x=>a,z=>s); y<=s;
end architecture;
configuration ccfg_smn1_cfg of ccfg_smn1_ent is
  for rtl
    for u_inv:inv use entity work.no_such_ent(rtl);
  end for;
end configuration ccfg_smn1_cfg;
