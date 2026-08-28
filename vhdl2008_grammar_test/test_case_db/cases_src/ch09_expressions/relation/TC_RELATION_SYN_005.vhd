-- =============================================================
-- Case ID: TC_RELATION_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_RELATION
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: relation ::= shift_expression [ relational_operator shift_expression ]
-- Case Type: Positive
-- Test Focus: <= and >= operators: two composite shift_expression operands (a+b) and (c+d) undergo inequality comparison
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity rel_le_ge_ent is
  port(a, b, c, d : in integer; r : out boolean);
end entity;
architecture rtl of rel_le_ge_ent is
begin
  r <= (a + b) <= (c + d);
end architecture rtl;
