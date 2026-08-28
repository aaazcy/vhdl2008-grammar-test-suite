-- =============================================================
-- Case ID: TC_PACKAGE_DECLARATION_SNN_S01
-- Rule Type: Syntax
-- BNF Production: PACKAGE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 4.5
-- Test Focus: package_declaration: missing "is" keyword
-- Case Type: Negative (Production-Specific)
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
package bad_pkg  -- ERROR: missing "is"
  constant C:integer:=1;
end package;
