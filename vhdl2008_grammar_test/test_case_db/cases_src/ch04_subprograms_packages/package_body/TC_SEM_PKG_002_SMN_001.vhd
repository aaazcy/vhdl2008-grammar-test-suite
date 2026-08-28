-- =============================================================
-- Case ID: TC_SEM_PKG_002_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_PKG_002
-- Standard Reference: IEEE 1076-2008 Section 4.7
-- Production: package_body ::= package body package_simple_name is package_body_declarative_part end [ package body ] [ package_simple_name ] ;
-- Rule Description: A package body must have a corresponding package declaration in the same design library
-- Case Type: Negative
-- Error Category: declaration_elaboration_error
-- Test Focus: package body orphan_body_pkg is analyzed without any corresponding package declaration for orphan_body_pkg in the design library, violating the body/declaration correspondence rule
-- Expected Result: Triggers semantic error: package "orphan_body_pkg" was not analysed
-- Dependencies: None
-- =============================================================
package body orphan_body_pkg is
end package body orphan_body_pkg;
