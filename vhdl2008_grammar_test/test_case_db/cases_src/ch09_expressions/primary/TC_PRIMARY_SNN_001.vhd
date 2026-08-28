-- =============================================================
-- Case ID: TC_PRIMARY_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_PRIMARY
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: primary ::= name | literal | aggregate | function_call | qualified_expression | type_conversion | allocator | ( expression )
-- Case Type: Negative
-- Test Focus: SNN — unclosed parentheses: the ( expression ) form is missing its closing right parenthesis
-- Expected Result: Triggers syntax error: missing closing parenthesis in primary
-- Dependencies: None
-- =============================================================
entity prim_snn1_ent is
  port(a : in integer; y : out integer);
end entity;
architecture err of prim_snn1_ent is
begin
  y <= (a + 1;
end architecture err;
