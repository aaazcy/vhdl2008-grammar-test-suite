-- =============================================================
-- Case ID: TC_SIMPLE_CONFIGURATION_SPECIFICATION_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIMPLE_CONFIGURATION_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.1
-- Production: simple_configuration_specification ::= for component_specification binding_indication [ ; ] end for [ ; ]
-- Case Type: Positive
-- Test Focus: binding_indication using only the entity name without specifying architecture — the "use entity work.entity_name" form omits the architecture identifier, verifies the architecture identifier in entity_aspect is optional, the parser should accept the binding form containing only the entity name
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity dff_pair is
  port(din : in bit_vector(1 downto 0); dout : out bit_vector(1 downto 0));
end entity dff_pair;

architecture rtl of dff_pair is
begin
end architecture rtl;


entity scs_syn7_ent is
  port(d : in bit_vector(1 downto 0); q : out bit_vector(1 downto 0));
end entity scs_syn7_ent;

architecture rtl of scs_syn7_ent is
  component dff_pair is
    port(din : in bit_vector(1 downto 0); dout : out bit_vector(1 downto 0));
  end component dff_pair;
  for u_ff : dff_pair use entity work.dff_pair;
  end for;
begin
  u_ff : dff_pair port map(din => d, dout => q);
end architecture rtl;
