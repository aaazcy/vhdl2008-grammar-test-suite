-- =============================================================
-- Case ID: TC_LIBRARY_UNIT_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_LIBRARY_UNIT
-- Standard Reference: IEEE 1076-2008 Section 13.1
-- Production: library_unit ::= primary_unit | secondary_unit
-- Case Type: Positive
-- Test Focus: library_unit as package_declaration (one of the primary_unit alternative forms): package containing type and constant declarations — verifies package_declaration as an alternative form of primary_unit is also a legal library_unit
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
package lu_pkg is
  constant C_MAX : positive := 256;
  type t_byte_arr is array(0 to 7) of bit;
end package lu_pkg;
