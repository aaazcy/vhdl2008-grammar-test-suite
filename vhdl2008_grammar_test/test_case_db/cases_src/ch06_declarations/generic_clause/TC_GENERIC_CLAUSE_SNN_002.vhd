-- =============================================================
-- Case ID: TC_GENERIC_CLAUSE_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_GENERIC_CLAUSE
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: generic_clause ::= generic ( generic_list ) ;
-- Case Type: Negative
-- Test Focus: generic_clause: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity generic_clause_e2 is end entity;
architecture bh of generic_clause_e2 is
  -- ERROR: invalid syntax in generic_clause
  signal s : bit;
begin
  s <= '1'
end architecture bh;