-- =============================================================
-- Case ID: TC_BLOCK_STATEMENT_PART_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_BLOCK_STATEMENT_PART
-- Standard Reference: IEEE 1076-2008 Section 11.2
-- Production: block_statement_part ::= { concurrent_statement }
-- Case Type: Positive
-- Test Focus: minimal form: block_statement_part is empty — the block contains only begin with no concurrent statement, verifying that the statement region of a block body may be empty
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity blk_part_empty_ent is
  port(clk : in bit);
end entity blk_part_empty_ent;
architecture bh of blk_part_empty_ent is
begin
  blk_empty : block is
  begin
  end block blk_empty;
end architecture bh;
