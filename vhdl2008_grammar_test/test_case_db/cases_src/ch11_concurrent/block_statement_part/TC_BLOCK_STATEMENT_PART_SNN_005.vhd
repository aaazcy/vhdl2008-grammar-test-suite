-- =============================================================
-- Case ID: TC_BLOCK_STATEMENT_PART_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_BLOCK_STATEMENT_PART
-- Standard Reference: IEEE 1076-2008 Section 11.2
-- Production: block_statement_part ::= { concurrent_statement }
-- Case Type: Negative
-- Test Focus: SNN: the target of a concurrent signal assignment in block_statement_part is undeclared — `s_undef <= a` references a signal declared neither in the block nor in the surrounding architecture, verifying that every signal referenced by a concurrent statement must be declared in visible scope
-- Expected Result: Triggers semantic error: undefined identifier in concurrent signal assignment
-- Dependencies: None
-- =============================================================
entity blk_part_snn5_ent is
  port(a : in bit; y : out bit);
end entity blk_part_snn5_ent;
architecture bh of blk_part_snn5_ent is
begin
  blk_undef : block is
  begin
    s_undef <= a;
    y <= s_undef;
  end block blk_undef;
end architecture bh;
