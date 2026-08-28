-- =============================================================
-- Case ID: TC_TYPE_MARK_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_TYPE_MARK
-- Standard Reference: IEEE 1076-2008 Section 6.3
-- Production: type_mark ::= type_name subtype_name
-- Case Type: Negative
-- Test Focus: type_mark: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity type_mark_e3 is end entity;
architecture bh of type_mark_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;