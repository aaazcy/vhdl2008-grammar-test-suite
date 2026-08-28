-- =============================================================
-- Case ID: TC_LOGICAL_EXPRESSION_SMN_003
-- Rule Type: Semantic
-- Related Rule ID: BNF_LOGICAL_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: logical_expression ::= relation { and relation } | relation { or relation } | relation { xor relation } | relation [ nand relation ] | relation [ nor relation ] | relation { xnor relation }
-- Case Type: Negative
-- Rule Description: The relational operators in a logical_expression must produce boolean-compatible results for the logical operators that connect them
-- Error Category: type_mismatch
-- Test Focus: relation result type conflicts with the logical operation target type: integer < integer returns boolean, assigned to a bit target
-- Expected Result: Triggers semantic error: cannot assign boolean expression result to bit target
-- Dependencies: None
-- =============================================================
entity logexpr_smn3_ent is
  port(a, b : in integer; r : out bit);
end entity;
architecture err of logexpr_smn3_ent is
begin
  r <= (a < b) and (a > 0);
end architecture err;
