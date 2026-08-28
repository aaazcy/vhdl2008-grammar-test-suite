-- =============================================================
-- Case ID: TC_CONSTRAINT_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONSTRAINT
-- Standard Reference: IEEE 1076-2008 Section 5.3.2
-- Production: constraint ::= range_constraint | array_constraint | record_constraint
-- Case Type: Negative
-- Test Focus: SNN: range of range_constraint missing its right bound - in 'integer range 10 downto' the direction has no bound expression after it, verifying range requires the full simple_expression direction simple_expression form
-- Expected Result: Triggers syntax error: primary expression expected
-- Dependencies: None
-- =============================================================
entity con10_ent is end entity;
architecture rtl of con10_ent is
  subtype t_bad is integer range 10 downto;
begin
end architecture;
