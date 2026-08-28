-- =============================================================
-- Case ID: TC_PACKAGE_BODY_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_BODY
-- Standard Reference: IEEE 1076-2008 Section 4.7
-- Production: package_body ::= package body package_simple_name is package_body_declarative_part end [ package body ] [ package_simple_name ] ;
-- Case Type: Negative
-- Test Focus: package_body: missing package_simple_name — the BNF requires an identifier after 'package body'; omitting the package name is a syntax error targeting the name slot of the package body
-- Expected Result: Triggers syntax error: an identifier is expected instead of 'is'
-- Dependencies: None
-- =============================================================
package body is
end package body;
