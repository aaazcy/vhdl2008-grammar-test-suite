-- =============================================================
-- Case ID: TC_ABSOLUTE_PATHNAME_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_ABSOLUTE_PATHNAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: absolute_pathname ::= . partial_pathname
-- Case Type: Negative
-- Test Focus: absolute_pathname: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity absolute_pathna_e3 is end entity;
architecture bh of absolute_pathna_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;