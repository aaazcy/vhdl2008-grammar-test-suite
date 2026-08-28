-- =============================================================
-- Case ID: TC_RELATION_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_RELATION
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: relation ::= shift_expression [ relational_operator shift_expression ]
-- Case Type: Negative
-- Test Focus: SNN — missing shift_expression after relational_operator: there is no right operand after =, so the relation is incomplete
-- Expected Result: Triggers syntax error: missing right operand after relational operator
-- Dependencies: None
-- =============================================================
entity rel_snn2_ent is
  port(a : in integer; r : out boolean);
end entity;
architecture err of rel_snn2_ent is
begin
  r <= a = ;
end architecture err;
