-- =============================================================
-- Case ID: TC_PACKAGE_BODY_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_BODY
-- Standard Reference: IEEE 1076-2008 Section 4.7
-- Production: package_body ::= package body package_simple_name is package_body_declarative_part end [ package body ] [ package_simple_name ] ;
-- Case Type: Negative
-- Test Focus: package_body: wrong identifier in closing — the BNF allows '[package_simple_name]' at the end, which must match the opening name; using a different identifier wrong_name is a mismatch error
-- Expected Result: Triggers syntax error: misspelling, "pb_kw5" expected
-- Dependencies: None
-- =============================================================
package pb_kw5 is
end package pb_kw5;
package body pb_kw5 is
end package body wrong_name;
