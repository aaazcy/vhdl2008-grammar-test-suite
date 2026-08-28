-- =============================================================
-- Case ID: TC_COMPONENT_CONFIGURATION_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_COMPONENT_CONFIGURATION
-- Standard Reference: IEEE 1076-2008 Section 3.4.3
-- Production: component_configuration ::= for component_specification [ binding_indication ] [ block_configuration ] end for ;
-- Case Type: Positive
-- Test Focus: component_configuration with binding_indication (entity_aspect): for instantiation_label:component_name use entity work.entity_name(arch), verifying a component_configuration that binds only an entity name without generic/port mapping
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity buf is
  port (x:in bit; z:out bit);
end entity buf;

architecture rtl of buf is
begin
end architecture rtl;

entity ccfg_bind_ent is
  port(a:in bit; y:out bit);
end entity;
architecture rtl of ccfg_bind_ent is
  component buf is port(x:in bit; z:out bit); end component;
  signal s:bit;
begin
  u_buf:buf port map(x=>a,z=>s); y<=s;
end architecture;
configuration ccfg_bind_cfg of ccfg_bind_ent is
  for rtl
    for u_buf:buf use entity work.buf(rtl);
    end for;
  end for;
end configuration ccfg_bind_cfg;
