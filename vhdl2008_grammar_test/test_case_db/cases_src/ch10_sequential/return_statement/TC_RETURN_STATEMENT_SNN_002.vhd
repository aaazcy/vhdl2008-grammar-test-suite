-- =============================================================
-- Case ID: TC_RETURN_STATEMENT_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_RETURN_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.13
-- Production: return_statement ::= [ label : ] return [ expression ] ;
-- Case Type: Negative
-- Test Focus: return_statement: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity return_statemen_e2 is end entity;
architecture bh of return_statemen_e2 is
  -- ERROR: invalid syntax in return_statement
  signal s : bit;
begin
  s <= '1'
end architecture bh;