-- =============================================================
-- Case ID: TC_INSTANTIATED_UNIT_SYN_S01
-- Rule Type: Syntax
-- BNF Production: INSTANTIATED_UNIT
-- Standard Reference: IEEE 1076-2008 Section 11.7
-- Test Focus: Instantiated unit: [component] component_name ｜ entity entity_name [(arch_name)] ｜ configuration config_name — component/entity/config instantiation target
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_instantiated_unit_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_instantiated_unit_syn_s01 is
  component comp_iu is port(x:in integer; y:out integer); end component;
  signal s_x,s_y:integer;
begin
  u_iu:comp_iu port map(x=>s_x,y=>s_y); s_x<=1; r<=s_y+1;end architecture bh;
