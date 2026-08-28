-- =============================================================
-- Case ID: TC_SECONDARY_UNIT_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_SECONDARY_UNIT
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: secondary_unit ::= architecture_body | package_body
-- Case Type: Negative
-- Test Focus: ERROR: package body with mismatched end label
-- Expected Result: Triggers
-- Dependencies: None
-- =============================================================
-- ERROR: package body with mismatched end label
entity sec_unit_snn_bad_label is end entity;
architecture rtl of sec_unit_snn_bad_label is
  package pkg is constant C:integer:=1; end package;
  package body pkg is constant C:integer:=1; end package body wrong;  -- ERROR: label mismatch
begin end architecture;