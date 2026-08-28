-- =============================================================
-- Case ID: TC_PRIMARY_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_PRIMARY
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: primary ::= name | literal | aggregate | function_call | qualified_expression | type_conversion | allocator | ( expression )
-- Case Type: Negative
-- Rule Description: Aggregate element count must match the target type element count
-- Error Category: element_mismatch
-- Test Focus: aggregate element count error: target bit_vector(3 downto 0) requires 4 elements, but the aggregate has only 3 elements
-- Expected Result: Triggers semantic error: aggregate element count mismatch
-- Dependencies: None
-- =============================================================
entity prim_smn1_ent is
  port(vec : out bit_vector(3 downto 0));
end entity;
architecture err of prim_smn1_ent is
begin
  vec <= ('0', '1', '0');
end architecture err;
