-- =============================================================
-- Case ID: TC_PRIMARY_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_PRIMARY
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: primary ::= name | literal | aggregate | function_call | qualified_expression | type_conversion | allocator | ( expression )
-- Case Type: Positive
-- Test Focus: function_call form: primary is the function call inc_by_one(x), whose return value is used directly as a primary
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity prim_fcall_ent is
  port(x : in integer; z : out integer);
end entity;
architecture rtl of prim_fcall_ent is
  function inc_by_one(v : integer) return integer is
  begin return v + 1; end function;
begin
  z <= inc_by_one(x);
end architecture rtl;
