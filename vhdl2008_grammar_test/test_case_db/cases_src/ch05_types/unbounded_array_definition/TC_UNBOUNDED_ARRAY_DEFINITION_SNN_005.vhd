-- =============================================================
-- Case ID: TC_UNBOUNDED_ARRAY_DEFINITION_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_UNBOUNDED_ARRAY_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: unbounded_array_definition ::= array ( index_subtype_definition { , index_subtype_definition } ) of element_subtype_indication
-- Case Type: Negative
-- Test Focus: Syntax error -- unbounded array definition with comma
--            but no second index_subtype_definition. A trailing comma
--            in the index list suggests another dimension is expected
--            but none is provided.
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity unbounded_arr_snn_trailing_comma is
end entity unbounded_arr_snn_trailing_comma;
architecture rtl of unbounded_arr_snn_trailing_comma is
  type t_bad is array (integer range <>,) of integer;  -- ERROR: trailing comma without second index
  signal s : t_bad(0 to 7);
begin
end architecture rtl;
