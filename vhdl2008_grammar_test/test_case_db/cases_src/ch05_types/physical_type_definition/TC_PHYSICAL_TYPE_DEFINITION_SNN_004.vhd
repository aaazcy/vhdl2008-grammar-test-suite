-- =============================================================
-- Case ID: TC_PHYSICAL_TYPE_DEFINITION_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_PHYSICAL_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: physical_type_definition ::= range_constraint units primary_unit_declaration { secondary_unit_declaration } end units
-- Case Type: Negative
-- Test Focus: Syntax error -- physical type missing 'units' keyword
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity ptd_snn_no_units is end entity;
architecture rtl of ptd_snn_no_units is
  type t_bad is range 0 to 1000 Hz; kHz=1000 Hz; end units;  -- ERROR: missing 'units' before Hz
begin
end architecture rtl;
