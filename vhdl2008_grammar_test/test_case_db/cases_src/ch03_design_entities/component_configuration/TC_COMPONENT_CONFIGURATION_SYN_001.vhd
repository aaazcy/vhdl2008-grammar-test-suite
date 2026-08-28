-- =============================================================
-- Case ID: TC_COMPONENT_CONFIGURATION_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_COMPONENT_CONFIGURATION
-- Standard Reference: IEEE 1076-2008 Section 3.4.3
-- Production: component_configuration ::= for component_specification [ binding_indication ] [ block_configuration ] end for ;
-- Case Type: Positive
-- Test Focus: Minimal component_configuration: contains only for component_specification + end for, without binding_indication and block_configuration, verifying the syntactic correctness of the minimal form
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ccfg_min_ent is
  port(a,b:in bit; y:out bit);
end entity;
architecture rtl of ccfg_min_ent is
  component and2 is port(x1,x2:in bit; z:out bit); end component;
  signal s:bit;
begin
  u_and:and2 port map(x1=>a,x2=>b,z=>s); y<=s;
end architecture;
configuration ccfg_min_cfg of ccfg_min_ent is
  for rtl
    for u_and:and2
    end for;
  end for;
end configuration ccfg_min_cfg;
