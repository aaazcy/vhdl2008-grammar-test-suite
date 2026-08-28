-- =============================================================
-- Case ID: TC_COMPOSITE_TYPE_DEFINITION_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_COMPOSITE_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.3.1
-- Production: composite_type_definition ::= array_type_definition | record_type_definition
-- Case Type: Negative
-- Test Focus: Syntax error -- record type definition missing the
--            'record' keyword. The parser expects 'record' to start
--            a record type definition. Without it the element
--            declarations are out of place.
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity comp_type_snn_missing_record is
end entity comp_type_snn_missing_record;
architecture rtl of comp_type_snn_missing_record is
  type t_bad is         -- ERROR: missing 'record' keyword
    x : integer;
    y : integer;
  end record;
  signal s : t_bad;
begin
end architecture rtl;
