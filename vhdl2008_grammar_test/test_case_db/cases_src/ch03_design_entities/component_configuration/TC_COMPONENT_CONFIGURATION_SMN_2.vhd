-- =============================================================
-- Case ID: TC_COMPONENT_CONFIGURATION_SMN_2
-- Rule Type: Semantic
-- Related Rule ID: BNF_COMPONENT_CONFIGURATION
-- Standard Reference: IEEE 1076-2008 Section 3.4.3
-- Production: component_configuration ::= for component_specification [ binding_indication ] [ block_configuration ] end for ;
-- Case Type: Negative
-- Test Focus: component_configuration references an undeclared instance label: in for undef_label:comp the undef_label has no corresponding instance in the architecture, verifying the instantiation_label of component_specification must reference an instantiated label
-- Expected Result: Triggers semantic error on undefined instantiation label
-- Dependencies: None
-- =============================================================
entity inv is
  port (x:in bit; z:out bit);
end entity inv;

architecture rtl of inv is
begin
end architecture rtl;

entity ccfg_sem1_ent is
  port(a:in bit; y:out bit);
end entity;
architecture rtl of ccfg_sem1_ent is
  component inv is port(x:in bit; z:out bit); end component;
  signal s:bit;
begin
  u_inv:inv port map(x=>a,z=>s); y<=s;
end architecture;
configuration ccfg_sem1_cfg of ccfg_sem1_ent is
  for rtl
    for u_nonexist:inv use entity work.inv(rtl);
  end for;
end configuration ccfg_sem1_cfg;
