-- =============================================================
-- Case ID: TC_BLOCK_STATEMENT_PART_SYN_S01
-- Rule Type: Syntax
-- BNF Production: BLOCK_STATEMENT_PART
-- Standard Reference: IEEE 1076-2008 Section 11.2
-- Test Focus: Block statement part: {concurrent_statement} — concurrent statements within block body
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_block_statement_part_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_block_statement_part_syn_s01 is
begin
  blk_stmts: block is
    signal s_loc:integer:=0;
  begin
    s_loc<=42;  -- concurrent signal assignment
    r<=s_loc;
  end block;end architecture bh;
