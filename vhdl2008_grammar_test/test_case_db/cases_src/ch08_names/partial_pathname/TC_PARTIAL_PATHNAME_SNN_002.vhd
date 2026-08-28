-- =============================================================
-- Case ID: TC_PARTIAL_PATHNAME_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_PARTIAL_PATHNAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: partial_pathname ::= { pathname_element . } object_simple_name
-- Case Type: Negative
-- Test Focus: partial_pathname: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity partial_pathnam_e2 is end entity;
architecture bh of partial_pathnam_e2 is
  -- ERROR: invalid syntax in partial_pathname
  signal s : bit;
begin
  s <= '1'
end architecture bh;