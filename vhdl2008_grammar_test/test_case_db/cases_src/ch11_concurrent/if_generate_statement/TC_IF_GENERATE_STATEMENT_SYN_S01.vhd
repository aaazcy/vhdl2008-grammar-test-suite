-- =============================================================
-- Case ID: TC_IF_GENERATE_STATEMENT_SYN_S01
-- Rule Type: Syntax
-- BNF Production: IF_GENERATE_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.8
-- Test Focus: If generate statement: generate_label: if condition generate generate_body {elsif generate} [else generate_body] end generate [label];
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_if_generate_statement_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_if_generate_statement_syn_s01 is
  signal s_ig:integer:=0;
begin
  gen_if: if true generate
    s_ig<=1;
  else generate
    s_ig<=0;
  end generate;
  r<=s_ig;end architecture bh;
