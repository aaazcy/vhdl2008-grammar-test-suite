-- =============================================================
-- Case ID: TC_SECONDARY_UNIT_DECLARATION_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_SECONDARY_UNIT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: secondary_unit_declaration ::= identifier = physical_literal ;
-- Case Type: Negative
-- Test Focus: syntax error -- missing '=' in secondary_unit_declaration
-- Expected Result: Triggers
-- Dependencies: None
-- =============================================================
entity sud_snn_missing_eq is end entity;
architecture rtl of sud_snn_missing_eq is
  type t_bad is range 0 to 1000 units kHz; MHz 1000 kHz; end units;  -- ERROR: missing '='
begin end architecture;