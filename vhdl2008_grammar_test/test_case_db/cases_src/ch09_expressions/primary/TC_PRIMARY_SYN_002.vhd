-- =============================================================
-- Case ID: TC_PRIMARY_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_PRIMARY
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: primary ::= name | literal | aggregate | function_call | qualified_expression | type_conversion | allocator | ( expression )
-- Case Type: Positive
-- Test Focus: literal form: primary is the integer literal 42, used directly as the source operand in an assignment
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity prim_literal_ent is
  port(y : out integer);
end entity;
architecture rtl of prim_literal_ent is
begin
  y <= 42;
end architecture rtl;
