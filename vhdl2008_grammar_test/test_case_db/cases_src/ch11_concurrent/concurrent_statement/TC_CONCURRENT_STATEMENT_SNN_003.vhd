-- =============================================================
-- Case ID: TC_CONCURRENT_STATEMENT_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONCURRENT_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.1
-- Production: concurrent_statement ::= block_statement process_statement
-- Case Type: Negative
-- Test Focus: concurrent_statement: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity concurrent_stat_e3 is end entity;
architecture bh of concurrent_stat_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;