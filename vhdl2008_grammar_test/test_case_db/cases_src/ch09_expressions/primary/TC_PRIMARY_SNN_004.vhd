-- =============================================================
-- Case ID: TC_PRIMARY_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_PRIMARY
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: primary ::= name | literal | aggregate | function_call | qualified_expression | type_conversion | allocator | ( expression )
-- Case Type: Negative
-- Test Focus: SNN — incomplete type_conversion: integer conversion is missing its argument; type_conversion must be followed by ( expression )
-- Expected Result: Triggers syntax error: missing argument in type conversion
-- Dependencies: None
-- =============================================================
entity prim_snn4_ent is
  port(y : out integer);
end entity;
architecture err of prim_snn4_ent is
begin
  y <= integer;
end architecture err;
