-- =============================================================
-- Case ID: TC_SECONDARY_UNIT_SYN_S01
-- Rule Type: Syntax
-- BNF Production: SECONDARY_UNIT
-- Standard Reference: IEEE 1076-2008 Section 5.2.4
-- Test Focus: Secondary unit: identifier = physical_literal — derived unit in physical type
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_secondary_unit_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_secondary_unit_syn_s01 is
  type t_su is range 0 to 1000000 units m; cm=10 m; dm=100 m; km=1000 m; end units; signal s_su:t_su:=0 m;
begin
  s_su<=1 km; r<=1;end architecture bh;
