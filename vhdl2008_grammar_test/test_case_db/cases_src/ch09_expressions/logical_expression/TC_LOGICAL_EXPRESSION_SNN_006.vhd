-- =============================================================
-- Case ID: TC_LOGICAL_EXPRESSION_SNN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_LOGICAL_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: logical_expression ::= relation { and relation } | relation { or relation } | relation { xor relation } | relation [ nand relation ] | relation [ nor relation ] | relation { xnor relation }
-- Case Type: Negative
-- Test Focus: SNN — extra operand after the nor form: nor only allows the optional single pair [ nor relation ], an extra relation violates the syntax
-- Expected Result: Triggers syntax error: nor form allows at most one nor relation
-- Dependencies: None
-- =============================================================
entity logexpr_snn6_ent is
  port(a, b, c : in boolean; r : out boolean);
end entity;
architecture err of logexpr_snn6_ent is
begin
  r <= a nor b nor c;
end architecture err;
