-- =============================================================
-- Case ID: TC_SEM_PKG_001_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: SEM_PKG_001
-- Standard Reference: IEEE 1076-2008 Section 4.5
-- Production: package_declaration ::= package identifier is package_header package_declarative_part end [ package ] [ package_simple_name ] ;
-- Rule Description: Every name referenced in a package declaration must denote a visible declaration
-- Case Type: Negative
-- Error Category: undeclared_identifier
-- Test Focus: package declaration contains a constant_declaration whose initializer references NO_SUCH_CONSTANT, an identifier that has never been declared and is not visible anywhere, so the declarative part cannot be resolved
-- Expected Result: Triggers semantic error: no declaration for "no_such_constant"
-- Dependencies: None
-- =============================================================
package sem_pkg1_pkg is
  constant C_BAD : integer := NO_SUCH_CONSTANT;
end package sem_pkg1_pkg;
