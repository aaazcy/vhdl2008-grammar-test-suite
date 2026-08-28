-- =============================================================
-- Case ID: TC_SECONDARY_UNIT_DECLARATION_SNN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_SECONDARY_UNIT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: secondary_unit_declaration ::= identifier = physical_literal ;
-- Case Type: Negative
-- Test Focus: Syntax error -- secondary_unit with non-numeric physical_literal
-- Expected Result: Triggers
-- Dependencies: None
-- =============================================================
entity sud_snn_non_numeric is end entity;
architecture rtl of sud_snn_non_numeric is
  type t_bad is range 0 to 1000 units kHz; MHz=abc kHz; end units;  -- ERROR: 'abc' not a number
begin end architecture;