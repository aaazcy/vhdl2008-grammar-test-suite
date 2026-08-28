-- =============================================================
-- Case ID: TC_BLOCK_STATEMENT_PART_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_BLOCK_STATEMENT_PART
-- Standard Reference: IEEE 1076-2008 Section 11.2
-- Production: block_statement_part ::= { concurrent_statement }
-- Case Type: Negative
-- Test Focus: SNN: concurrent signal assignment in block_statement_part missing a semicolon — `s1 <= a` is followed directly by the next statement with no semicolon separator, verifying that concurrent statements must be separated by semicolons
-- Expected Result: Triggers syntax error: missing ";" after concurrent signal assignment
-- Dependencies: None
-- =============================================================
entity blk_part_snn1_ent is
  port(a : in bit; y1, y2 : out bit);
end entity blk_part_snn1_ent;
architecture bh of blk_part_snn1_ent is
  signal s_int : bit;
begin
  blk_err : block is
  begin
    y1 <= a
    y2 <= s_int;
  end block blk_err;
end architecture bh;
