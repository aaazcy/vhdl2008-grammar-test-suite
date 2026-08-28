-- =============================================================
-- Case ID: TC_PACKAGE_BODY_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_BODY
-- Standard Reference: IEEE 1076-2008 Section 4.7
-- Production: package_body ::= package body package_simple_name is package_body_declarative_part end [ package body ] [ package_simple_name ] ;
-- Case Type: Negative
-- Test Focus: package_body: missing terminating semicolon — the BNF requires the entire package_body to terminate with ';' after 'end'; omitting the semicolon is a syntax error targeting the ';' token
-- Expected Result: Triggers syntax error: missing ";" at end of package body
-- Dependencies: None
-- =============================================================
package pb_kw4 is
end package pb_kw4;
package body pb_kw4 is
end package body pb_kw4
