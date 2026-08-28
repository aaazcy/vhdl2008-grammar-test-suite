-- =============================================================
-- Case ID: TC_RELATION_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_RELATION
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: relation ::= shift_expression [ relational_operator shift_expression ]
-- Case Type: Positive
-- Rule Description: Relational operators require comparable types for both operands; the result type is always boolean
-- Test Focus: comparable types: two shift_expression operands of integer type are compared with =, both sides share the same type and are comparable, and the result type is boolean
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity rel_sem1_ent is
  port(left_val, right_val : in integer; is_equal : out boolean);
end entity;
architecture rtl of rel_sem1_ent is
begin
  is_equal <= left_val = right_val;
end architecture rtl;
