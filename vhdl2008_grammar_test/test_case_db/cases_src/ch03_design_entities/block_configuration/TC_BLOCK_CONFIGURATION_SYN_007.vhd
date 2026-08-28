-- =============================================================
-- Case ID: TC_BLOCK_CONFIGURATION_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_BLOCK_CONFIGURATION
-- Standard Reference: IEEE 1076-2008 Section 3.4.2
-- Production: block_configuration ::= for block_specification { use_clause } { configuration_item } end for ;
-- Case Type: Positive
-- Test Focus: block_configuration with multiple configuration_items: a use_clause followed by two component_configurations binding different components, verifying that multiple configuration_items in sequence are legal
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity inv is
  port (a : in bit; y : out bit);
end entity inv;

architecture rtl of inv is
begin
end architecture rtl;

entity mux2 is
  port (a, b, sel : in bit; y : out bit);
end entity mux2;

architecture rtl of mux2 is
begin
end architecture rtl;

entity bcfg_multi_item_ent is
  port(a, b, sel : in bit; y : out bit);
end entity;
architecture rtl of bcfg_multi_item_ent is
  component mux2 is port(a, b, sel : in bit; y : out bit); end component;
  component inv is port(a : in bit; y : out bit); end component;
  signal s_mux, s_inv : bit;
begin
  u_mux : mux2 port map(a => a, b => b, sel => sel, y => s_mux);
  u_inv : inv port map(a => s_mux, y => s_inv);
  y <= s_inv;
end architecture;
configuration bcfg_multi_item_cfg of bcfg_multi_item_ent is
  for rtl
    for u_mux : mux2 use entity work.mux2(rtl);
    end for;
    for u_inv : inv use entity work.inv(rtl);
    end for;
  end for;
end configuration bcfg_multi_item_cfg;
