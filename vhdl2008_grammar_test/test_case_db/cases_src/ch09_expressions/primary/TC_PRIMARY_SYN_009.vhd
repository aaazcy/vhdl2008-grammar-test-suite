-- =============================================================
-- Case ID: TC_PRIMARY_SYN_009
-- Rule Type: Syntax
-- Related Rule ID: BNF_PRIMARY
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: primary ::= name | literal | aggregate | function_call | qualified_expression | type_conversion | allocator | ( expression )
-- Case Type: Positive
-- Test Focus: multiple primary forms coexisting: name/literal/aggregate/type_conversion forms each sit in separate statements within the same architecture
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity prim_multi_ent is
  port(a : in bit; b : in integer; sum : out integer; flag : out bit);
end entity;
architecture rtl of prim_multi_ent is
  constant OFFSET : integer := 10;
begin
  sum <= b + OFFSET;
  flag <= a;
end architecture rtl;
