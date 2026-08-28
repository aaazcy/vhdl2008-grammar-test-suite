-- =============================================================
-- Case ID: TC_CONCURRENT_STATEMENT_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONCURRENT_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.1
-- Production: concurrent_statement ::= block_statement process_statement
-- Case Type: Negative
-- Test Focus: concurrent_statement: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity concurrent_stat_e2 is end entity;
architecture bh of concurrent_stat_e2 is
  -- ERROR: invalid syntax in concurrent_statement
  signal s : bit;
begin
  s <= '1'
end architecture bh;