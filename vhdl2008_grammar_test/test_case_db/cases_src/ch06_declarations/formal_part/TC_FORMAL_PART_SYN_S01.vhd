-- =============================================================
-- Case ID: TC_FORMAL_PART_SYN_S01
-- Rule Type: Syntax
-- BNF Production: FORMAL_PART
-- Standard Reference: IEEE 1076-2008 Section 6.5
-- Test Focus: Formal part: formal_designator ｜ function_name (formal_designator) — scalar and conversion function formals
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_formal_part_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_formal_part_syn_s01 is
begin
  r<=42;end architecture bh;
