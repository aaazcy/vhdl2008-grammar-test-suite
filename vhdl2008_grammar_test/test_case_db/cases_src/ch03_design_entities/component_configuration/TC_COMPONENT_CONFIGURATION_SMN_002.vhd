-- =============================================================
-- Case ID: TC_COMPONENT_CONFIGURATION_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: BNF_COMPONENT_CONFIGURATION
-- Standard Reference: IEEE 1076-2008 Section 3.4.3
-- Production: component_configuration ::= for component_specification [ binding_indication ] [ block_configuration ] end for ;
-- Case Type: Negative
-- Test Focus: generic map type mismatch in component_configuration: the binding generic map maps a time-type value to an integer-type generic parameter, verifying type compatibility checking of generic mapping
-- Expected Result: Triggers semantic error on generic type mismatch
-- Dependencies: None
-- =============================================================
entity dff is
  generic (WIDTH:integer);
  port (clk,d:in bit; q:out bit);
end entity dff;

architecture rtl of dff is
begin
end architecture rtl;

entity ccfg_smn2_ent is
  port(clk,d:in bit; q:out bit);
end entity;
architecture rtl of ccfg_smn2_ent is
  component dff is
    generic(WIDTH:integer);
    port(clk,d:in bit; q:out bit);
  end component;
  signal s_q:bit;
begin
  u_dff:dff generic map(WIDTH=>8) port map(clk=>clk,d=>d,q=>s_q);
  q<=s_q;
end architecture;
configuration ccfg_smn2_cfg of ccfg_smn2_ent is
  for rtl
    for u_dff:dff use entity work.dff(rtl)
      generic map(WIDTH=>"string");
  end for;
end configuration ccfg_smn2_cfg;
