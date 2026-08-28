-- =============================================================
-- Case ID: TC_RETURN_STATEMENT_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_RETURN_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.13
-- Production: return_statement ::= [ label : ] return [ expression ] ;
-- Case Type: Negative
-- Test Focus: return_statement: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity return_statemen_e3 is end entity;
architecture bh of return_statemen_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;