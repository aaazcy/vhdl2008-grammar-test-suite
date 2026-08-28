-- =============================================================
-- Case ID: TC_RELATION_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_RELATION
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: relation ::= shift_expression [ relational_operator shift_expression ]
-- Case Type: Negative
-- Test Focus: SNN — doubled relational_operator: one relation contains two comparison operators, but the BNF allows [ relational_operator shift_expression ] only once
-- Expected Result: Triggers syntax error: consecutive relational operators not allowed
-- Dependencies: None
-- =============================================================
entity rel_snn1_ent is
  port(a, b, c : in integer; r : out boolean);
end entity;
architecture err of rel_snn1_ent is
begin
  r <= a = b = c;
end architecture err;
