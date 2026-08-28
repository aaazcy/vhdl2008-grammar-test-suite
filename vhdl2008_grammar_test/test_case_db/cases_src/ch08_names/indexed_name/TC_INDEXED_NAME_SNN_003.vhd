-- =============================================================
-- Case ID: TC_INDEXED_NAME_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_INDEXED_NAME
-- Standard Reference: IEEE 1076-2008 Section 8.4
-- Production: indexed_name ::= prefix ( expression { , expression } )
-- Case Type: Negative
-- Test Focus: indexed_name: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity indexed_name_e3 is end entity;
architecture bh of indexed_name_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;