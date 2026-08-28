-- =============================================================
-- Case ID: TC_ACTUAL_DESIGNATOR_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_ACTUAL_DESIGNATOR
-- Standard Reference: IEEE 1076-2008 Section 6.5.7.1
-- Production: actual_designator ::= [ inertial ] expression signal_name | variable_name | file_name | subtype_indication | subprogram_name | instantiated_package_name | open
-- Case Type: Negative
-- Test Focus: actual_designator: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity actual_designat_e2 is end entity;
architecture bh of actual_designat_e2 is
  -- ERROR: invalid syntax in actual_designator
  signal s : bit;
begin
  s <= '1'
end architecture bh;