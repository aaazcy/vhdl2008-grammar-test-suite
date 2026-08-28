-- =============================================================
-- Case ID: TC_DISCRETE_RANGE_SNN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_DISCRETE_RANGE
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: discrete_range ::= discrete_subtype_indication | range
-- Case Type: Negative
-- Test Focus: syntax error -- discrete_range with non-discrete type (real)
-- Expected Result: Triggers
-- Dependencies: None
-- =============================================================
entity dr_snn_real is end entity;
architecture rtl of dr_snn_real is
  type t_bad is array(real range 0.0 to 1.0) of integer;  -- ERROR: real not discrete
begin end architecture;