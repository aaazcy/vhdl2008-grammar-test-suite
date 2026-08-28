-- =============================================================
-- Case ID: TC_SUBPROGRAM_SPECIFICATION_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 4.2
-- Production: subprogram_specification ::= procedure_specification | function_specification
-- Case Type: Negative
-- Test Focus: subprogram_specification: procedure with return type — a procedure_specification does NOT have a return clause; adding 'return integer' to the procedure p_bad is a syntax error because return is only part of function_specification
-- Expected Result: Triggers syntax error: 'return' not allowed for a procedure
-- Dependencies: None
-- =============================================================
package ss_ret_pkg is
  procedure p_bad(x : integer) return integer;
end package ss_ret_pkg;
