-- =============================================================
-- Case ID: TC_COMPONENT_CONFIGURATION_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_COMPONENT_CONFIGURATION
-- Standard Reference: IEEE 1076-2008 Section 3.4.3
-- Production: component_configuration ::= for component_specification [ binding_indication ] [ block_configuration ] end for ;
-- Case Type: Positive
-- Test Focus: component_configuration with embedded block_configuration: for label:comp use entity... is directly followed by nested for...end for configuring other instances at the same level, verifying component_configuration can contain a block_configuration clause
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity and2 is
  port (x1,x2:in bit; z:out bit);
end entity and2;

architecture rtl of and2 is
begin
end architecture rtl;

entity or2 is
  port (x1,x2:in bit; z:out bit);
end entity or2;

architecture rtl of or2 is
begin
end architecture rtl;

entity ccfg_block_ent is
  port(a,b,c:in bit; y_and,y_or:out bit);
end entity;
architecture rtl of ccfg_block_ent is
  component and2 is port(x1,x2:in bit; z:out bit); end component;
  component or2  is port(x1,x2:in bit; z:out bit); end component;
  signal s_and,s_or:bit;
begin
  u_and:and2 port map(x1=>a,x2=>b,z=>s_and);
  u_or:or2 port map(x1=>s_and,x2=>c,z=>s_or);
  y_and<=s_and; y_or<=s_or;
end architecture;
configuration ccfg_block_cfg of ccfg_block_ent is
  for rtl
    for u_and:and2 use entity work.and2(rtl);
      for rtl
      end for;
    end for;
    for u_or:or2 use entity work.or2(rtl);
    end for;
  end for;
end configuration ccfg_block_cfg;
