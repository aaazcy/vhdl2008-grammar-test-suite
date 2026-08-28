-- =============================================================
-- Case ID: TC_RELATIVE_PATHNAME_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_RELATIVE_PATHNAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: relative_pathname ::= { ^ . } partial_pathname
-- Case Type: Negative
-- Test Focus: relative_pathname: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity relative_pathna_e2 is end entity;
architecture bh of relative_pathna_e2 is
  -- ERROR: invalid syntax in relative_pathname
  signal s : bit;
begin
  s <= '1'
end architecture bh;