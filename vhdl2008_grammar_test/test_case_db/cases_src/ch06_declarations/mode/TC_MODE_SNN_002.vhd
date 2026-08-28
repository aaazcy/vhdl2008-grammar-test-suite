-- =============================================================
-- Case ID: TC_MODE_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_MODE
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: mode ::= in | out | inout | buffer | linkage
-- Case Type: Negative
-- Test Focus: mode: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity mode_e2 is end entity;
architecture bh of mode_e2 is
  -- ERROR: invalid syntax in mode
  signal s : bit;
begin
  s <= '1'
end architecture bh;