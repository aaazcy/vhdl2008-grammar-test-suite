-- =============================================================
-- Case ID: TC_PRIMARY_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: BNF_PRIMARY
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: primary ::= name | literal | aggregate | function_call | qualified_expression | type_conversion | allocator | ( expression )
-- Case Type: Negative
-- Rule Description: type_conversion must be between closely related types
-- Error Category: type_mismatch
-- Test Focus: illegal type conversion: bit to integer has no corresponding conversion function and is not among closely related types
-- Expected Result: Triggers semantic error: type conversion not allowed between these types
-- Dependencies: None
-- =============================================================
entity prim_smn2_ent is
  port(flag : in bit; y : out integer);
end entity;
architecture err of prim_smn2_ent is
begin
  y <= integer(flag);
end architecture err;
