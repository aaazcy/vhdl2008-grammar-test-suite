-- =============================================================
-- Case ID: TC_BLOCK_STATEMENT_PART_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: BNF_BLOCK_STATEMENT_PART
-- Standard Reference: IEEE 1076-2008 Section 11.2
-- Production: block_statement_part ::= { concurrent_statement }
-- Rule Description: Concurrent signal assignments in a block statement part must reference signals visible in the enclosing declarative region
-- Case Type: Negative
-- Error Category: scope_error
-- Test Focus: SMN: a concurrent assignment inside a block references a signal declared only in another block — verifying that the scope of concurrent statements in block_statement_part is limited to the current block and outer regions, so signals cannot be accessed across peer block boundaries
-- Expected Result: Triggers semantic error: signal not visible in this scope
-- Dependencies: None
-- =============================================================
entity blk_part_smn2_ent is
  port(a : in bit; y : out bit);
end entity blk_part_smn2_ent;
architecture bh of blk_part_smn2_ent is
begin
  blk_a : block is
    signal s_hidden : bit;
  begin
    s_hidden <= a;
  end block blk_a;
  blk_b : block is
  begin
    y <= blk_a.s_hidden;
  end block blk_b;
end architecture bh;
