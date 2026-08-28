-- =============================================================
-- Case ID: TC_TYPE_MARK_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_TYPE_MARK
-- Standard Reference: IEEE 1076-2008 Section 6.3
-- Production: type_mark ::= type_name subtype_name
-- Case Type: Negative
-- Test Focus: type_mark: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity type_mark_e2 is end entity;
architecture bh of type_mark_e2 is
  -- ERROR: invalid syntax in type_mark
  signal s : bit;
begin
  s <= '1'
end architecture bh;