-- =============================================================
-- Case ID: TC_FORMAL_DESIGNATOR_SYN_S01
-- Rule Type: Syntax
-- BNF Production: FORMAL_DESIGNATOR
-- Standard Reference: IEEE 1076-2008 Section 6.5
-- Test Focus: Formal designator: identifier ｜ type_mark (identifier) — formal parameter name in association
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_formal_designator_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_formal_designator_syn_s01 is
begin
  r<=42;end architecture bh;
