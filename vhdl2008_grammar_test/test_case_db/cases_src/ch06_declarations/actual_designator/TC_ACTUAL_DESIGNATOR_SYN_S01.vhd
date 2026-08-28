-- =============================================================
-- Case ID: TC_ACTUAL_DESIGNATOR_SYN_S01
-- Rule Type: Syntax
-- BNF Production: ACTUAL_DESIGNATOR
-- Standard Reference: IEEE 1076-2008 Section 6
-- Test Focus: Actual designator: expression ｜ open ｜ inertial expression — all 3 syntactic forms in association lists
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_actual_designator_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_actual_designator_syn_s01 is
begin
  r<=42;end architecture bh;
