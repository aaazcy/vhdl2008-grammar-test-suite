-- =============================================================
-- Case ID: TC_BLOCK_STATEMENT_SNN_S01
-- Rule Type: Syntax
-- BNF Production: BLOCK_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 3.3.2
-- Test Focus: block_statement: guard expression syntax error
-- Case Type: Negative (Production-Specific)
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity blk_e is end entity;
architecture bh of blk_e is begin
  bad_blk: block (s_clk  -- ERROR: missing closing paren
    signal s_clk:bit; begin s_clk<=not s_clk; end block;
end architecture;
