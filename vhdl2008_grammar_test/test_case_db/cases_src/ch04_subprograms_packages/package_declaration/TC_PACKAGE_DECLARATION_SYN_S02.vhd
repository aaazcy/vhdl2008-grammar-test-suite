-- =============================================================
-- Case ID: TC_PACKAGE_DECLARATION_SYN_S02
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 4.5
-- Production: package_declaration ::= package identifier is package_header package_declarative_part end [ package ] [ package_simple_name ] ;
-- Case Type: Positive
-- Test Focus: package with deferred constants and subtypes
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
package pkg_spc2 is
  constant C_DEFER : integer;
  subtype t_byte is integer range 0 to 255;
  type t_ptr is access integer;
end package;
package body pkg_spc2 is
  constant C_DEFER : integer := 42;
end package body;
