-- =============================================================
-- Case ID: TC_CONSTRAINT_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONSTRAINT
-- Standard Reference: IEEE 1076-2008 Section 5.3.2
-- Production: constraint ::= range_constraint | array_constraint | record_constraint
-- Case Type: Negative
-- Test Focus: syntax error -- array_constraint with wrong bracket type
-- Expected Result: Triggers
-- Dependencies: None
-- =============================================================
entity con_snn_bad_bracket is end entity;
architecture rtl of con_snn_bad_bracket is
  type t_vec is array(integer range <>) of integer;
  subtype t_bad is t_vec[0 to 7];  -- ERROR: square brackets instead of parentheses
begin end architecture;