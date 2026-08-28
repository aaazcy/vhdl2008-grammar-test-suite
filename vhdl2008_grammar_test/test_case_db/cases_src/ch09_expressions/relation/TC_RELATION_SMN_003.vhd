-- =============================================================
-- Case ID: TC_RELATION_SMN_003
-- Rule Type: Semantic
-- Related Rule ID: BNF_RELATION
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: relation ::= shift_expression [ relational_operator shift_expression ]
-- Case Type: Negative
-- Rule Description: The result type of a relation is boolean; assigning to a non-boolean target is illegal
-- Error Category: type_mismatch
-- Test Focus: relational operator result type error: the relation returns boolean, but the target is of bit type
-- Expected Result: Triggers semantic error: cannot assign boolean to bit target
-- Dependencies: None
-- =============================================================
entity rel_smn3_ent is
  port(a, b : in integer; r : out bit);
end entity;
architecture err of rel_smn3_ent is
begin
  r <= a < b;
end architecture err;
