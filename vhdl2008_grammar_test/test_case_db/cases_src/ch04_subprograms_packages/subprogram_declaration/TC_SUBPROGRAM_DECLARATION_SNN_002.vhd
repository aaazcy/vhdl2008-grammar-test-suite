-- =============================================================
-- Case ID: TC_SUBPROGRAM_DECLARATION_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 4.2
-- Production: subprogram_declaration ::= subprogram_specification ;
-- Case Type: Negative
-- Test Focus: subprogram_declaration: missing terminating semicolon — the BNF requires subprogram_specification ';' with a mandatory ';' separator; the function specification f_add is not terminated by ';' before 'end'
-- Expected Result: Triggers syntax error: ';' is expected instead of 'end'
-- Dependencies: None
-- =============================================================
package spd_nosemi_pkg is
  function f_add(x : integer) return integer
end package spd_nosemi_pkg;
