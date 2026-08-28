-- =============================================================
-- Case ID: TC_RELATION_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_RELATION
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: relation ::= shift_expression [ relational_operator shift_expression ]
-- Case Type: Negative
-- Test Focus: SNN — unrecognized comparison symbol: using => as a comparison operator (actually a direction token), which is not a legal relational_operator
-- Expected Result: Triggers syntax error: invalid relational operator
-- Dependencies: None
-- =============================================================
entity rel_snn5_ent is
  port(a, b : in integer; r : out boolean);
end entity;
architecture err of rel_snn5_ent is
begin
  r <= a => b;
end architecture err;
