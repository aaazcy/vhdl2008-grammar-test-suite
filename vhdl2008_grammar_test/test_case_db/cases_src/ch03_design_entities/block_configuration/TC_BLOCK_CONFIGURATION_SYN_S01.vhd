-- =============================================================
-- Case ID: TC_BLOCK_CONFIGURATION_SYN_S01
-- Rule Type: Syntax
-- BNF Production: BLOCK_CONFIGURATION
-- Standard Reference: IEEE 1076-2008 Section 3.4.1
-- Test Focus: Block configuration: for block_spec use binding_indication [port_map] [generic_map]; nested block configs
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity dummy is port(a:in bit;b:out bit); end entity;
architecture beh of dummy is begin b<=a; end architecture beh;
entity tc_block_configuration_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_block_configuration_syn_s01 is
  signal s_i,s_o:bit; component comp_bc is port(a:in bit;b:out bit); end component;
  for u_bc:comp_bc use entity work.dummy(beh) port map(a=>s_i,b=>s_o);
begin
  u_bc:comp_bc port map(a=>s_i,b=>s_o); s_i<='1'; r<=1;end architecture bh;
