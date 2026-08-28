-- =============================================================
-- Case ID: TC_ACTUAL_DESIGNATOR_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_ACTUAL_DESIGNATOR
-- Standard Reference: IEEE 1076-2008 Section 6.5.7.1
-- Production: actual_designator ::= [ inertial ] expression signal_name | variable_name | file_name | subtype_indication | subprogram_name | instantiated_package_name | open
-- Case Type: Negative
-- Test Focus: actual_designator: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity actual_designat_e3 is end entity;
architecture bh of actual_designat_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;