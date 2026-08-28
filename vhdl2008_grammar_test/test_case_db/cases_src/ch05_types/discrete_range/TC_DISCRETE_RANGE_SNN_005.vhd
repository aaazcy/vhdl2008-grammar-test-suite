-- =============================================================
-- Case ID: TC_DISCRETE_RANGE_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_DISCRETE_RANGE
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: discrete_range ::= discrete_subtype_indication | range
-- Case Type: Negative
-- Test Focus: syntax error -- discrete_range missing the range keyword in type declaration
-- Expected Result: Triggers
-- Dependencies: None
-- =============================================================
entity dr_snn_missing_range is end entity;
architecture rtl of dr_snn_missing_range is
  type t_bad is array(integer 0 to 7) of integer;  -- ERROR: missing 'range' keyword
begin end architecture;