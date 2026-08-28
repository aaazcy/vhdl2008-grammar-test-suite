-- =============================================================
-- Case ID: TC_PRIMARY_SMN_003
-- Rule Type: Semantic
-- Related Rule ID: BNF_PRIMARY
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: primary ::= name | literal | aggregate | function_call | qualified_expression | type_conversion | allocator | ( expression )
-- Case Type: Negative
-- Rule Description: Function call as primary requires the function to be visible and parameter types to match
-- Error Category: parameter_mismatch
-- Test Focus: function call actual argument type error: the function expects an integer parameter, the actual argument is a bit_vector, and the parameter types are incompatible
-- Expected Result: Triggers semantic error: function argument type mismatch
-- Dependencies: None
-- =============================================================
entity prim_smn3_ent is
  port(vec : in bit_vector(7 downto 0); y : out integer);
end entity;
architecture err of prim_smn3_ent is
  function double(x : integer) return integer is
  begin return x * 2; end function;
begin
  y <= double(vec);
end architecture err;
