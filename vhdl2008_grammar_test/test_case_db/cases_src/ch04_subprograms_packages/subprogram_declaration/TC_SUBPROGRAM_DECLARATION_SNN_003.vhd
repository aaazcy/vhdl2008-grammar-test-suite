-- =============================================================
-- Case ID: TC_SUBPROGRAM_DECLARATION_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 4.2
-- Production: subprogram_declaration ::= subprogram_specification ;
-- Case Type: Negative
-- Test Focus: subprogram_declaration: function without return type — the subprogram_specification for a function must include 'return type_mark'; the specification of f_bad ends after the parameter list without a return clause
-- Expected Result: Triggers syntax error: 'return' expected
-- Dependencies: None
-- =============================================================
package spd_noret_pkg is
  function f_bad(x : integer);
end package spd_noret_pkg;
