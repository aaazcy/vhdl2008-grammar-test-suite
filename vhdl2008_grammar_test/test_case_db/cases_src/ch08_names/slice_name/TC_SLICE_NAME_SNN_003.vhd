-- =============================================================
-- Case ID: TC_SLICE_NAME_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_SLICE_NAME
-- Standard Reference: IEEE 1076-2008 Section 8.4
-- Production: slice_name ::= prefix ( discrete_range )
-- Case Type: Negative
-- Test Focus: slice_name: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity slice_name_e3 is end entity;
architecture bh of slice_name_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;