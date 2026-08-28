-- =============================================================
-- Case ID: TC_COMPONENT_CONFIGURATION_SMN_3
-- Rule Type: Semantic
-- Related Rule ID: BNF_COMPONENT_CONFIGURATION
-- Standard Reference: IEEE 1076-2008 Section 3.4.3
-- Production: component_configuration ::= for component_specification [ binding_indication ] [ block_configuration ] end for ;
-- Case Type: Negative
-- Test Focus: Port mismatch in the binding_indication of component_configuration: the port count/direction of the bound entity is incompatible with the bound component declaration, verifying the port mapping of binding_indication must be consistent with the component declaration
-- Expected Result: Triggers semantic error on port mismatch in binding
-- Dependencies: None
-- =============================================================
entity and2 is
  port (x1,x2:in bit; z:out bit);
end entity and2;

architecture rtl of and2 is
begin
end architecture rtl;

entity ccfg_sem2_ent is
  port(a,b:in bit; y:out bit);
end entity;
architecture rtl of ccfg_sem2_ent is
  component and2 is port(x1,x2:in bit; z:out bit); end component;
  signal s:bit;
begin
  u_and:and2 port map(x1=>a,x2=>b,z=>s); y<=s;
end architecture;
configuration ccfg_sem2_cfg of ccfg_sem2_ent is
  for rtl
    for u_and:and2 use entity work.and2(rtl)
      port map(x1=>a, z=>s);
  end for;
end configuration ccfg_sem2_cfg;
