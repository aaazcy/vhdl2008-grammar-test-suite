-- =============================================================
-- Case ID: TC_RELATION_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_RELATION
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: relation ::= shift_expression [ relational_operator shift_expression ]
-- Case Type: Positive
-- Test Focus: = equality operator: two shift_expression operands undergo equality comparison, verifying the simplest relational_operator form
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity rel_eq_ent is
  port(a, b : in integer; r : out boolean);
end entity;
architecture rtl of rel_eq_ent is
begin
  r <= a = b;
end architecture rtl;
