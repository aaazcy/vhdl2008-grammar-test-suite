-- =============================================================
-- Case ID: TC_RELATION_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_RELATION
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: relation ::= shift_expression [ relational_operator shift_expression ]
-- Case Type: Positive
-- Test Focus: minimal form: a single shift_expression (signal name a) with no relational_operator, as the minimal shape of a relation
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity rel_min_ent is
  port(a : in bit; y : out bit);
end entity;
architecture rtl of rel_min_ent is
begin
  y <= a;
end architecture rtl;
