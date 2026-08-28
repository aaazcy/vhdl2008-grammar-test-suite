-- =============================================================
-- Case ID: TC_CONCURRENT_ASSERTION_STATEMENT_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONCURRENT_ASSERTION_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.5
-- Production: concurrent_assertion_statement ::= [ label : ] [ postponed ] assertion ;
-- Case Type: Negative
-- Test Focus: concurrent_assertion_statement: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity concurrent_asse_e2 is end entity;
architecture bh of concurrent_asse_e2 is
  -- ERROR: invalid syntax in concurrent_assertion_statement
  signal s : bit;
begin
  s <= '1'
end architecture bh;