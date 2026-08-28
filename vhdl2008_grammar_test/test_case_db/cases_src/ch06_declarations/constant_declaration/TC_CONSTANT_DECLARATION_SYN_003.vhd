-- =============================================================
-- Case ID: TC_CONSTANT_DECLARATION_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONSTANT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.4.2.1
-- Production: constant_declaration ::= constant identifier_list : subtype_indication [ := expression ] ;
-- Case Type: Positive
-- Test Focus: Exercises constant_declaration with a deferred constant (no initializer) in a package, completed later in the body.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
package constant_decl_syn3_pkg is
  constant PKG_VERSION : integer;
  constant PKG_NAME    : string(1 to 4);
end package constant_decl_syn3_pkg;

package body constant_decl_syn3_pkg is
  constant PKG_VERSION : integer := 1;
  constant PKG_NAME    : string(1 to 4) := "PKG1";
end package body constant_decl_syn3_pkg;
