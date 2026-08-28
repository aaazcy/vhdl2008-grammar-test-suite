-- =============================================================
-- Case ID: TC_INDEX_CONSTRAINT_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_INDEX_CONSTRAINT
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: index_constraint ::= ( discrete_range { , discrete_range } )
-- Case Type: Negative
-- Test Focus: index_constraint: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity index_constrain_e2 is end entity;
architecture bh of index_constrain_e2 is
  -- ERROR: invalid syntax in index_constraint
  signal s : bit;
begin
  s <= '1'
end architecture bh;