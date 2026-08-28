-- =============================================================
-- Case ID: TC_RELATION_SNN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_RELATION
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: relation ::= shift_expression [ relational_operator shift_expression ]
-- Case Type: Negative
-- Test Focus: SNN — ? operator missing its companion characters: ? appears alone without = / < >, and a matching operator must include ?= or a matching inequality symbol
-- Expected Result: Triggers syntax error: incomplete matching relational operator
-- Dependencies: None
-- =============================================================
entity rel_snn6_ent is
  port(a, b : in bit_vector(3 downto 0); r : out boolean);
end entity;
architecture err of rel_snn6_ent is
begin
  r <= a ? b;
end architecture err;
