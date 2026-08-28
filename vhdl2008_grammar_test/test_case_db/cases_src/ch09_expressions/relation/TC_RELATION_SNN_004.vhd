-- =============================================================
-- Case ID: TC_RELATION_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_RELATION
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: relation ::= shift_expression [ relational_operator shift_expression ]
-- Case Type: Negative
-- Test Focus: SNN — ?= used on a non-matching type: matching equality applied to integer type, but ?= requires an array type
-- Expected Result: Triggers semantic error: matching operator requires matching type
-- Dependencies: None
-- =============================================================
entity rel_snn4_ent is
  port(a, b : in integer; r : out boolean);
end entity;
architecture err of rel_snn4_ent is
begin
  r <= a ?= b;
end architecture err;
