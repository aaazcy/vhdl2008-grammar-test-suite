-- =============================================================
-- Case ID: TC_GENERATE_SPECIFICATION_SYN_S01
-- Rule Type: Syntax
-- BNF Production: GENERATE_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 11.8
-- Test Focus: Generate specification: discrete_range ｜ static_expression ｜ alternative_label — generate param specification (for/if/case)
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_generate_specification_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_generate_specification_syn_s01 is
begin
  r<=42;end architecture bh;
