-- =============================================================
-- Case ID: TC_BLOCK_CONFIGURATION_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_BLOCK_CONFIGURATION
-- Standard Reference: IEEE 1076-2008 Section 3.4.2
-- Production: block_configuration ::= for block_specification { use_clause } { configuration_item } end for ;
-- Case Type: Negative
-- Test Focus: block_configuration semantic error: in configuration_item, the entity port count of component_configuration does not match the component declaration
-- Expected Result: Triggers semantic error: port count mismatch in component configuration
-- Dependencies: None
-- =============================================================
entity and2 is
  port (i1, i2 : in bit; o : out bit);
end entity and2;

architecture rtl of and2 is
begin
end architecture rtl;

entity bcfg_smn1_ent is
  port(a, b : in bit; y : out bit);
end entity;
architecture rtl of bcfg_smn1_ent is
  component and2 is port(i1, i2 : in bit; o : out bit); end component;
  signal s_and : bit;
begin
  u_and : and2 port map(i1 => a, i2 => b, o => s_and);
  y <= s_and;
end architecture;
configuration bcfg_smn1_cfg of bcfg_smn1_ent is
  for rtl
    for u_and : and2
      use entity work.and2(rtl)
        port map(i1 => a, i2 => b, o => s_and, extra => open);
    end for;
  end for;
end configuration bcfg_smn1_cfg;
