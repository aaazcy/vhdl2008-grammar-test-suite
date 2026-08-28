-- =============================================================
-- Case ID: TC_ACTUAL_PART_SYN_S01
-- Rule Type: Syntax
-- BNF Production: ACTUAL_PART
-- Standard Reference: IEEE 1076-2008 Section 6
-- Test Focus: Actual part: actual_designator ｜ function_name (actual_designator) — scalar and conversion actuals
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_actual_part_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_actual_part_syn_s01 is
begin
  r<=42;end architecture bh;
