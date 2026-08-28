-- =============================================================
-- Case ID: TC_CONFIGURATION_ITEM_SYN_S01
-- Rule Type: Syntax
-- BNF Production: CONFIGURATION_ITEM
-- Standard Reference: IEEE 1076-2008 Section 3.4
-- Test Focus: Configuration item: block_configuration ｜ component_configuration
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity any_ent is port(x:in bit;y:out bit); end entity;
architecture any_arch of any_ent is begin y<=x; end architecture any_arch;
entity tc_configuration_item_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_configuration_item_syn_s01 is
  component comp_ci is port(x:in bit;y:out bit); end component;
  signal s_i,s_o:bit;
  for u_ci:comp_ci use entity work.any_ent(any_arch) port map(x=>s_i,y=>s_o);
begin
  u_ci:comp_ci port map(x=>s_i,y=>s_o); s_i<='0'; r<=1;end architecture bh;
