-- =============================================================
-- Case ID: TC_BLOCK_STATEMENT_PART_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_BLOCK_STATEMENT_PART
-- Standard Reference: IEEE 1076-2008 Section 11.2
-- Production: block_statement_part ::= { concurrent_statement }
-- Case Type: Negative
-- Test Focus: block_statement_part: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity block_statement_e2 is end entity;
architecture bh of block_statement_e2 is
  -- ERROR: invalid syntax in block_statement_part
  signal s : bit;
begin
  s <= '1'
end architecture bh;