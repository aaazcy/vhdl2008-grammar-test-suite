-- =============================================================
-- Case ID: TC_PARTIAL_PATHNAME_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_PARTIAL_PATHNAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: partial_pathname ::= { pathname_element . } object_simple_name
-- Case Type: Negative
-- Test Focus: partial_pathname: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity partial_pathnam_e3 is end entity;
architecture bh of partial_pathnam_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;