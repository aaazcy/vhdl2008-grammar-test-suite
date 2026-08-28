-- =============================================================
-- Case ID: TC_PRIMARY_SYN_010
-- Rule Type: Syntax
-- Related Rule ID: BNF_PRIMARY
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: primary ::= name | literal | aggregate | function_call | qualified_expression | type_conversion | allocator | ( expression )
-- Case Type: Positive
-- Test Focus: primary in complex expression context: name/a and literal/1 act as function actual parameters, verifying the legality of primary in actual parameter position
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity prim_context_ent is
  port(a, b : in integer; r : out integer);
end entity;
architecture rtl of prim_context_ent is
  function max_of(x, y : integer) return integer is
  begin
    if x > y then return x; else return y; end if;
  end function;
begin
  r <= max_of(a, 0) + max_of(b, -1);
end architecture rtl;
