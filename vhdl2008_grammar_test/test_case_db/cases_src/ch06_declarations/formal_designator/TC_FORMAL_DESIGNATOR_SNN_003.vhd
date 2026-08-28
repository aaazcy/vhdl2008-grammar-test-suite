-- =============================================================
-- Case ID: TC_FORMAL_DESIGNATOR_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_FORMAL_DESIGNATOR
-- Standard Reference: IEEE 1076-2008 Section 6.5.7.1
-- Production: formal_designator ::= generic_name port_name | parameter_name
-- Case Type: Negative
-- Test Focus: formal_designator: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity formal_designat_e3 is end entity;
architecture bh of formal_designat_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;