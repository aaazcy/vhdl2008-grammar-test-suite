-- =============================================================
-- Case ID: TC_PACKAGE_BODY_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_BODY
-- Standard Reference: IEEE 1076-2008 Section 4.7
-- Production: package_body ::= package body package_simple_name is package_body_declarative_part end [ package body ] [ package_simple_name ] ;
-- Case Type: Negative
-- Test Focus: package_body: missing keyword 'is' after the package_simple_name — the BNF requires 'is' to introduce the package_body_declarative_part; omitting it is a syntax error targeting the 'is' token
-- Expected Result: Triggers syntax error: 'is' is expected instead of 'end'
-- Dependencies: None
-- =============================================================
package pb_kw1 is
end package pb_kw1;
package body pb_kw1 end package body pb_kw1;
