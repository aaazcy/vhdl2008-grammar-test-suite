-- =============================================================
-- Case ID: TC_COMPOUND_CONFIGURATION_SPECIFICATION_SYN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_COMPOUND_CONFIGURATION_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.1
-- Production: compound_configuration_specification ::= for component_specification binding_indication ; verification_unit_binding_indication ; { verification_unit_binding_indication ; } end for ;
-- Case Type: Positive
-- Test Focus: Compound form with configuration entity_aspect + port_map_aspect + vunit — exercises "use configuration work.cfg_name" as the entity_aspect within the compound form, followed by a port map and a verification_unit_binding_indication
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ccs_config_vunit is
  port(din : in bit_vector(3 downto 0); dout : out bit_vector(3 downto 0));
end entity;

architecture bh of ccs_config_vunit is
  component inv_4bit is
    port(a : in bit_vector(3 downto 0); y : out bit_vector(3 downto 0));
  end component;
  for u_inv : inv_4bit use configuration work.inv_4bit_cfg
    port map(a=>din, y=>dout);
    use vunit inv_protocol;
    use vunit inv_scan;
  end for;
begin
  u_inv : inv_4bit port map(a=>din, y=>dout);
end architecture bh;
