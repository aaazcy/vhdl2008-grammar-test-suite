-- =============================================================
-- Case ID: TC_CASE_GENERATE_STATEMENT_SYN_S01
-- Rule Type: Syntax
-- BNF Production: CASE_GENERATE_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.8
-- Test Focus: Case generate statement: case expression generate case_generate_alternative end generate; — VHDL 2008 case-driven generate
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_case_generate_statement_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_case_generate_statement_syn_s01 is
  constant s_gv:integer:=1;
begin
  gen_cg: case s_gv generate
    when 1 => r<=10;
    when others => r<=0;
  end generate;end architecture bh;
