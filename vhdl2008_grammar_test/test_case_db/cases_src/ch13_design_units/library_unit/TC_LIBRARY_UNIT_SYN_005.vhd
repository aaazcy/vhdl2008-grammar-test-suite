-- =============================================================
-- Case ID: TC_LIBRARY_UNIT_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_LIBRARY_UNIT
-- Standard Reference: IEEE 1076-2008 Section 13.1
-- Production: library_unit ::= primary_unit | secondary_unit
-- Case Type: Positive
-- Test Focus: library_unit as package_body (secondary_unit alternative form): package body implements the subprogram body declared in package_declaration — verifies package_body as an alternative form of secondary_unit is also a legal library_unit
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
package lu_body_pkg is
  function f_add(a, b : integer) return integer;
end package lu_body_pkg;

package body lu_body_pkg is
  function f_add(a, b : integer) return integer is
  begin
    return a + b;
  end function f_add;
end package body lu_body_pkg;
