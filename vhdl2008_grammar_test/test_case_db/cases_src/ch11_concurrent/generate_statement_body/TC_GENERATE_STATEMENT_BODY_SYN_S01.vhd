-- =============================================================
-- Case ID: TC_GENERATE_STATEMENT_BODY_SYN_S01
-- Rule Type: Syntax
-- BNF Production: GENERATE_STATEMENT_BODY
-- Standard Reference: IEEE 1076-2008 Section 11.8
-- Test Focus: Generate statement body: [block_declarative_part begin] {concurrent_statement} — body of generate (for/if/case)
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_generate_statement_body_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_generate_statement_body_syn_s01 is
  signal s_gsb:integer:=0;
begin
  gen_body: for i in 0 to 2 generate
    s_gsb<=s_gsb+i;  -- concurrent statement in generate body
  end generate;
  r<=s_gsb;end architecture bh;
