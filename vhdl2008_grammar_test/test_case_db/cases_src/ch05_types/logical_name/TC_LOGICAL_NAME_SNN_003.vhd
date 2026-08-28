-- =============================================================
-- Case ID: TC_LOGICAL_NAME_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_LOGICAL_NAME
-- Standard Reference: IEEE 1076-2008 Section 5.5.1
-- Production: logical_name ::= identifier
-- Case Type: Negative
-- Test Focus: logical_name: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity logical_name_e3 is end entity;
architecture bh of logical_name_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;