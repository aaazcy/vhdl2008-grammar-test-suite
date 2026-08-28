-- =============================================================
-- Case ID: TC_PHYSICAL_TYPE_DEFINITION_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_PHYSICAL_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: physical_type_definition ::= range_constraint units primary_unit_declaration { secondary_unit_declaration } end units
-- Case Type: Negative
-- Test Focus: Syntax error -- physical type missing 'end units' closing
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity ptd_snn_no_end is end entity;
architecture rtl of ptd_snn_no_end is
  type t_bad is range 0 to 1000 units Hz; kHz=1000 Hz;  -- ERROR: missing 'end units'
begin
end architecture rtl;
