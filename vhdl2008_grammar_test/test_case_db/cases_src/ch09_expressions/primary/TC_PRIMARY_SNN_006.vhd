-- =============================================================
-- Case ID: TC_PRIMARY_SNN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_PRIMARY
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: primary ::= name | literal | aggregate | function_call | qualified_expression | type_conversion | allocator | ( expression )
-- Case Type: Negative
-- Test Focus: SNN — qualified_expression misuse: type name followed by a string literal but missing the apostrophe qualifier
-- Expected Result: Triggers syntax error: malformed qualified expression
-- Dependencies: None
-- =============================================================
entity prim_snn6_ent is
  port(y : out bit_vector(3 downto 0));
end entity;
architecture err of prim_snn6_ent is
begin
  y <= bit_vector("1010");
end architecture err;
