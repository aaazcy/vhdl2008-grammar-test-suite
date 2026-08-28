-- =============================================================
-- Case ID: TC_PRIMARY_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_PRIMARY
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: primary ::= name | literal | aggregate | function_call | qualified_expression | type_conversion | allocator | ( expression )
-- Case Type: Negative
-- Test Focus: SNN — illegal name reference: an undeclared identifier is used as a primary
-- Expected Result: Triggers semantic error: undeclared identifier
-- Dependencies: None
-- =============================================================
entity prim_snn2_ent is
  port(a : in integer; y : out integer);
end entity;
architecture err of prim_snn2_ent is
begin
  y <= undeclared_signal;
end architecture err;
