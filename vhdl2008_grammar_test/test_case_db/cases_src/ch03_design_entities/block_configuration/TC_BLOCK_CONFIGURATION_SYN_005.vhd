-- =============================================================
-- Case ID: TC_BLOCK_CONFIGURATION_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_BLOCK_CONFIGURATION
-- Standard Reference: IEEE 1076-2008 Section 3.4.2
-- Production: block_configuration ::= for block_specification { use_clause } { configuration_item } end for ;
-- Case Type: Positive
-- Test Focus: block_configuration nested component_configuration with generic map and port map: outer for architecture, inner for component binding an entity with explicit generic values and port mapping
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity reg4 is
  generic(WIDTH : integer);
  port(d : in bit_vector(3 downto 0); q : out bit_vector(3 downto 0));
end entity reg4;

architecture rtl of reg4 is
begin
end architecture rtl;


entity bcfg_nest_ent is
  port(d : in bit_vector(3 downto 0); q : out bit_vector(3 downto 0));
end entity;
architecture rtl of bcfg_nest_ent is
  component reg4 is
    generic(WIDTH : integer);
    port(d : in bit_vector(3 downto 0); q : out bit_vector(3 downto 0));
  end component;
  signal s_reg : bit_vector(3 downto 0);
begin
  u_reg : reg4 generic map(WIDTH => 4) port map(d => d, q => s_reg);
  q <= s_reg;
end architecture;
configuration bcfg_nest_cfg of bcfg_nest_ent is
  for rtl
    for u_reg : reg4
      use entity work.reg4(rtl)
        generic map(WIDTH => 4)
        port map(d => d, q => q);
    end for;
  end for;
end configuration bcfg_nest_cfg;
