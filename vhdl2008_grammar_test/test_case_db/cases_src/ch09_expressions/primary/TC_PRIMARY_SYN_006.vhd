-- =============================================================
-- Case ID: TC_PRIMARY_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_PRIMARY
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: primary ::= name | literal | aggregate | function_call | qualified_expression | type_conversion | allocator | ( expression )
-- Case Type: Positive
-- Test Focus: qualified_expression form: primary is bit_vector'("1010"), removing ambiguity in an overloaded context
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity prim_qual_ent is
  port(y : out bit_vector(3 downto 0));
end entity;
architecture rtl of prim_qual_ent is
begin
  y <= bit_vector'("1010");
end architecture rtl;
