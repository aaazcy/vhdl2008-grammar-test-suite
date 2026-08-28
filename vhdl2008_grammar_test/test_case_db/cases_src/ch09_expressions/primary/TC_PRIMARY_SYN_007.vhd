-- =============================================================
-- Case ID: TC_PRIMARY_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_PRIMARY
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: primary ::= name | literal | aggregate | function_call | qualified_expression | type_conversion | allocator | ( expression )
-- Case Type: Positive
-- Test Focus: allocator form: primary is new integer'(42), dynamically allocating an access type object
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity prim_alloc_ent is
  port(trigger : in bit; val : out integer);
end entity;
architecture rtl of prim_alloc_ent is
  type int_ptr is access integer;
begin
  process(trigger)
    variable sp : int_ptr;
  begin
    sp := new integer'(10);
    val <= sp.all;
  end process;
end architecture rtl;
