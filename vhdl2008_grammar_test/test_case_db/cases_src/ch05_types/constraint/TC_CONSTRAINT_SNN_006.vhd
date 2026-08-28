-- =============================================================
-- Case ID: TC_CONSTRAINT_SNN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONSTRAINT
-- Standard Reference: IEEE 1076-2008 Section 5.3.2
-- Production: constraint ::= range_constraint | array_constraint | record_constraint
-- Case Type: Negative
-- Test Focus: syntax error -- record_constraint referencing non-existent record field
-- Expected Result: Triggers
-- Dependencies: None
-- =============================================================
entity con_snn_bad_field is end entity;
architecture rtl of con_snn_bad_field is
  type t_rec is record x:integer; end record;
  subtype t_bad is t_rec(y=>0 to 7);  -- ERROR: field 'y' does not exist
begin end architecture;