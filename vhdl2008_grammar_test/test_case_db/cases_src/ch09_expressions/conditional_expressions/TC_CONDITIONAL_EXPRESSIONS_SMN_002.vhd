-- =============================================================
-- Case ID: TC_CONDITIONAL_EXPRESSIONS_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: SEM_CONDITIONAL_EXPRESSIONS_PRIORITY
-- Standard Reference: IEEE 1076-2008 Section 9.2.1
-- Production: conditional_expressions ::= expression when condition { else expression when condition } [ else expression ]
-- Case Type: Negative
-- Rule Description: All branch expressions in a conditional expression must have the same type
-- Error Category: Type mismatch between branches
-- Test Focus: SMN: the branches of a conditional expression have inconsistent types — in a_i when c_s else b_b, a_i is integer while b_b is boolean; all branches of the same conditional expression must have the same type
-- Expected Result: Triggers analysis error: can't match boolean with integer
-- Dependencies: None
-- =============================================================

entity cond_expr_branch_mix is
  port (a_i : in integer; b_b : in boolean; c_s : in boolean; y_o : out integer);
end entity cond_expr_branch_mix;

architecture vhdl2008 of cond_expr_branch_mix is
begin
  y_o <= a_i when c_s else b_b;
end architecture vhdl2008;
