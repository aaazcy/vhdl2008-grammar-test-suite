-- =============================================================
-- Case ID: TC_SUBPROGRAM_SPECIFICATION_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 4.2
-- Production: subprogram_specification ::= procedure_specification | function_specification
-- Case Type: Negative
-- Test Focus: subprogram_specification: neither procedure nor function keyword — the BNF requires either 'procedure' or 'function' as the subprogram kind keyword to begin the specification; 'my_op(a : integer);' starts with a bare name instead
-- Expected Result: Triggers syntax error: object class keyword such as 'variable' is expected
-- Dependencies: None
-- =============================================================
package ss_kind_pkg is
  my_op(a : integer);
end package ss_kind_pkg;
