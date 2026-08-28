-- =============================================================
-- Case ID: TC_INDEX_SUBTYPE_DEFINITION_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_INDEX_SUBTYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: index_subtype_definition ::= type_mark range <>
-- Case Type: Negative
-- Test Focus: Syntax error -- index subtype definition missing the
--            'range <>' tokens. The unbounded array definition requires
--            'range <>' to indicate an unconstrained index; without
--            it the parser cannot tell this is an unbound definition.
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity idx_sub_def_snn_missing_range is
end entity idx_sub_def_snn_missing_range;
architecture rtl of idx_sub_def_snn_missing_range is
  type t_bad is array (integer) of integer;  -- ERROR: missing 'range <>' for unconstrained
  signal s : t_bad(0 to 7);
begin
end architecture rtl;
