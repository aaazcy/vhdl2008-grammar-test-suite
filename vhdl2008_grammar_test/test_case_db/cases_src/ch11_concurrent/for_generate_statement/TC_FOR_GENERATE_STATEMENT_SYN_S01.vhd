-- =============================================================
-- Case ID: TC_FOR_GENERATE_STATEMENT_SYN_S01
-- Rule Type: Syntax
-- BNF Production: FOR_GENERATE_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.8
-- Test Focus: For generate statement: generate_label: for parameter in discrete_range generate generate_body end generate [label];
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_for_generate_statement_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_for_generate_statement_syn_s01 is
  signal s_fg:integer:=0;
begin
  gen_fg: for i in 0 to 3 generate
    s_fg<=s_fg+i;
  end generate;
  r<=s_fg;end architecture bh;
