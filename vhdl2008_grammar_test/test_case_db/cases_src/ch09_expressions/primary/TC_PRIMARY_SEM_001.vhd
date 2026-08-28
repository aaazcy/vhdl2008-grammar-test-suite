-- =============================================================
-- Case ID: TC_PRIMARY_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_PRIMARY
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: primary ::= name | literal | aggregate | function_call | qualified_expression | type_conversion | allocator | ( expression )
-- Case Type: Positive
-- Rule Description: Name resolution: the name used as a primary must be visible and resolve to a valid declaration
-- Test Focus: name resolution: a constant declared in the architecture declarative part serves as a primary, verifying visibility rules
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity prim_sem1_ent is
  port(y : out integer);
end entity;
architecture rtl of prim_sem1_ent is
  constant THRESHOLD : integer := 100;
begin
  y <= THRESHOLD;
end architecture rtl;
