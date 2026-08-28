-- =============================================================
-- Case ID: TC_CONSTRAINED_ARRAY_DEFINITION_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONSTRAINED_ARRAY_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: constrained_array_definition ::= array index_constraint of element_subtype_indication
-- Case Type: Negative
-- Test Focus: Syntax error -- constrained array definition missing
--            the 'of' keyword between the index_constraint and
--            element_subtype_indication.
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity con_arr_def_snn_missing_of is
end entity con_arr_def_snn_missing_of;
architecture rtl of con_arr_def_snn_missing_of is
  type t_bad is array (0 to 7) integer;  -- ERROR: missing 'of' keyword
  signal s : t_bad;
begin
end architecture rtl;
