-- =============================================================
-- Case ID: TC_PRIMARY_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_PRIMARY
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: primary ::= name | literal | aggregate | function_call | qualified_expression | type_conversion | allocator | ( expression )
-- Case Type: Negative
-- Test Focus: SNN — aggregate missing elements: the aggregate is empty "( )", has no positional elements, and the syntax is incomplete
-- Expected Result: Triggers syntax error: empty aggregate is not a valid primary
-- Dependencies: None
-- =============================================================
entity prim_snn5_ent is
  port(y : out bit_vector(0 downto 0));
end entity;
architecture err of prim_snn5_ent is
begin
  y <= ( );
end architecture err;
