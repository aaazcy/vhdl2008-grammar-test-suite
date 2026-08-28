-- =============================================================
-- Case ID: TC_SUBPROGRAM_KIND_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_KIND
-- Standard Reference: IEEE 1076-2008 Section 4.3
-- Production: subprogram_kind ::= procedure | function
-- Case Type: Negative
-- Test Focus: subprogram_kind: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity subprogram_kind_e2 is end entity;
architecture bh of subprogram_kind_e2 is
  -- ERROR: invalid syntax in subprogram_kind
  signal s : bit;
begin
  s <= '1'
end architecture bh;