-- =============================================================
-- Case ID: TC_INDEX_CONSTRAINT_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_INDEX_CONSTRAINT
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: index_constraint ::= ( discrete_range { , discrete_range } )
-- Case Type: Negative
-- Test Focus: index_constraint: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity index_constrain_e3 is end entity;
architecture bh of index_constrain_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;