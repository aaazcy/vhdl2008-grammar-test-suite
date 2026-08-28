-- =============================================================
-- Case ID: TC_PRIMARY_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_PRIMARY
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: primary ::= name | literal | aggregate | function_call | qualified_expression | type_conversion | allocator | ( expression )
-- Case Type: Positive
-- Test Focus: aggregate form: primary is the bit vector aggregate "(a, b, c, d)", assigned to a bit_vector signal
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity prim_aggregate_ent is
  port(a, b, c, d : in bit; vec_out : out bit_vector(3 downto 0));
end entity;
architecture rtl of prim_aggregate_ent is
begin
  vec_out <= (a, b, c, d);
end architecture rtl;
