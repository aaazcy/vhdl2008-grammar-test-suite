-- =============================================================
-- Case ID: TC_RELATION_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_RELATION
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: relation ::= shift_expression [ relational_operator shift_expression ]
-- Case Type: Negative
-- Test Focus: SNN — wrong operator symbol: using =/ as the matching inequality operator, the correct form is ?/=
-- Expected Result: Triggers syntax error: invalid relational operator token
-- Dependencies: None
-- =============================================================
entity rel_snn3_ent is
  port(a, b : in bit_vector(3 downto 0); r : out boolean);
end entity;
architecture err of rel_snn3_ent is
begin
  r <= a =/ b;
end architecture err;
