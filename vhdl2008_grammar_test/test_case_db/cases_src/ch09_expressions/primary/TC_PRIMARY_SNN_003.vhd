-- =============================================================
-- Case ID: TC_PRIMARY_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_PRIMARY
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: primary ::= name | literal | aggregate | function_call | qualified_expression | type_conversion | allocator | ( expression )
-- Case Type: Negative
-- Test Focus: SNN — empty parentheses: ( expression ) contains no expression inside, so the primary is incomplete
-- Expected Result: Triggers syntax error: empty parenthesized expression
-- Dependencies: None
-- =============================================================
entity prim_snn3_ent is
  port(a : in bit; y : out bit);
end entity;
architecture err of prim_snn3_ent is
begin
  y <= ();
end architecture err;
