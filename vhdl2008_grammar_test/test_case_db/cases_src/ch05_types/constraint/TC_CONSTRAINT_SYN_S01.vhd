-- =============================================================
-- Case ID: TC_CONSTRAINT_SYN_S01
-- Rule Type: Syntax
-- BNF Production: CONSTRAINT
-- Standard Reference: IEEE 1076-2008 Section 5.1
-- Test Focus: Constraint: range_constraint ｜ array_constraint ｜ index_constraint ｜ record_constraint
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_constraint_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_constraint_syn_s01 is
  type t_c is range 0 to 255; subtype t_c_r is t_c range 0 to 15;
  subtype t_c_i is integer range 0 to 7; signal s_c1:t_c_r; signal s_c2:t_c_i;
begin
  s_c1<=15; s_c2<=7; r<=integer(s_c1)+s_c2;end architecture bh;
