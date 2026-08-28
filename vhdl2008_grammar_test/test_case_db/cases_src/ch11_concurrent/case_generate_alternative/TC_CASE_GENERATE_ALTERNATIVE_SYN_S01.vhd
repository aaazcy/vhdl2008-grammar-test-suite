-- =============================================================
-- Case ID: TC_CASE_GENERATE_ALTERNATIVE_SYN_S01
-- Rule Type: Syntax
-- BNF Production: CASE_GENERATE_ALTERNATIVE
-- Standard Reference: IEEE 1076-2008 Section 11.8
-- Test Focus: Case generate alternative: when choices => generate_statement_body — single alternative in case generate (VHDL 2008)
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_case_generate_alternative_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_case_generate_alternative_syn_s01 is
begin
  r<=42;end architecture bh;
