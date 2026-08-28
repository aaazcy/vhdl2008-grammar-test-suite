-- =============================================================
-- Case ID: TC_PRIMARY_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_PRIMARY
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: primary ::= name | literal | aggregate | function_call | qualified_expression | type_conversion | allocator | ( expression )
-- Case Type: Positive
-- Test Focus: minimal form — name: primary as the simple signal name data_in assigned directly, verifying the minimal primary shape
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity prim_name_ent is
  port(data_in : in bit; data_out : out bit);
end entity;
architecture rtl of prim_name_ent is
begin
  data_out <= data_in;
end architecture rtl;
