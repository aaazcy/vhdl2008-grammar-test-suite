-- =============================================================
-- Case ID: TC_PRIMARY_UNIT_SNN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_PRIMARY_UNIT
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: primary_unit ::= entity_declaration | configuration_declaration | package_declaration
-- Case Type: Negative
-- Test Focus: Syntax error -- package declaration missing 'is' keyword
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
package pu_bad_pkg  -- ERROR: missing 'is' keyword
  constant C : integer := 0;
end package pu_bad_pkg;
