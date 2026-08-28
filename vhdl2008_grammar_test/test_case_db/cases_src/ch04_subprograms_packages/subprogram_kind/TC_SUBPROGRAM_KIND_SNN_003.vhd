-- =============================================================
-- Case ID: TC_SUBPROGRAM_KIND_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_KIND
-- Standard Reference: IEEE 1076-2008 Section 4.3
-- Production: subprogram_kind ::= procedure | function
-- Case Type: Negative
-- Test Focus: subprogram_kind: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity subprogram_kind_e3 is end entity;
architecture bh of subprogram_kind_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;