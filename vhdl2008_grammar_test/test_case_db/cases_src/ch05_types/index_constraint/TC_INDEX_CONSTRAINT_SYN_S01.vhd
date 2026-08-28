-- =============================================================
-- Case ID: TC_INDEX_CONSTRAINT_SYN_S01
-- Rule Type: Syntax
-- BNF Production: INDEX_CONSTRAINT
-- Standard Reference: IEEE 1076-2008 Section 5.3.2
-- Test Focus: Index constraint: (discrete_range {, discrete_range}) — 1D, 2D, multi-dim
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_index_constraint_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_index_constraint_syn_s01 is
  type t_ic is array(integer range <>, integer range <>) of integer;
  signal s_ic1:t_ic(0 to 3,0 to 7); signal s_ic2:t_ic(7 downto 0,3 downto 0);
begin
  s_ic1(0,0)<=1; s_ic2(7,3)<=2; r<=s_ic1(0,0)+s_ic2(7,3);end architecture bh;
