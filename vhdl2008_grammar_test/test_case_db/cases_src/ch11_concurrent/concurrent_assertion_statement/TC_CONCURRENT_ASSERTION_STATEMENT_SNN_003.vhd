-- =============================================================
-- Case ID: TC_CONCURRENT_ASSERTION_STATEMENT_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONCURRENT_ASSERTION_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.5
-- Production: concurrent_assertion_statement ::= [ label : ] [ postponed ] assertion ;
-- Case Type: Negative
-- Test Focus: concurrent_assertion_statement: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity concurrent_asse_e3 is end entity;
architecture bh of concurrent_asse_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;