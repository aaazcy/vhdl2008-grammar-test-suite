-- =============================================================
-- Case ID: TC_BLOCK_STATEMENT_PART_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_BLOCK_STATEMENT_PART
-- Standard Reference: IEEE 1076-2008 Section 11.2
-- Production: block_statement_part ::= { concurrent_statement }
-- Case Type: Negative
-- Test Focus: block_statement_part: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity block_statement_e3 is end entity;
architecture bh of block_statement_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;