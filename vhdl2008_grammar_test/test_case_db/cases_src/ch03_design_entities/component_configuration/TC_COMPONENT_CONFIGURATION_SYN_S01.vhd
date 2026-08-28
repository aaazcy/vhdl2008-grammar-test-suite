-- =============================================================
-- Case ID: TC_COMPONENT_CONFIGURATION_SYN_S01
-- Rule Type: Syntax
-- BNF Production: COMPONENT_CONFIGURATION
-- Standard Reference: IEEE 1076-2008 Section 3.4.3
-- Test Focus: Component configuration: for component_specification use binding_indication [block_configuration];
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity some_ent is port(x:in integer;y:out integer); end entity;
architecture beh of some_ent is begin y<=x; end architecture beh;
entity tc_component_configuration_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_component_configuration_syn_s01 is
  component comp_cc is port(x:in integer;y:out integer); end component;
  signal s_x,s_y:integer;
  for u_cc:comp_cc use entity work.some_ent(beh) port map(x=>s_x,y=>s_y);
begin
  u_cc:comp_cc port map(x=>s_x,y=>s_y); s_x<=10; r<=s_y+1;end architecture bh;
