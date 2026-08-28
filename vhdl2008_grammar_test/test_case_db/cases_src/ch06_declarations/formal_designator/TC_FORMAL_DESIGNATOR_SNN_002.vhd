-- =============================================================
-- Case ID: TC_FORMAL_DESIGNATOR_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_FORMAL_DESIGNATOR
-- Standard Reference: IEEE 1076-2008 Section 6.5.7.1
-- Production: formal_designator ::= generic_name port_name | parameter_name
-- Case Type: Negative
-- Test Focus: formal_designator: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity formal_designat_e2 is end entity;
architecture bh of formal_designat_e2 is
  -- ERROR: invalid syntax in formal_designator
  signal s : bit;
begin
  s <= '1'
end architecture bh;