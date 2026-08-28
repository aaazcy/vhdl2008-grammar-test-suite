-- =============================================================
-- Case ID: TC_LOGICAL_NAME_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_LOGICAL_NAME
-- Standard Reference: IEEE 1076-2008 Section 5.5.1
-- Production: logical_name ::= identifier
-- Case Type: Negative
-- Test Focus: ERROR: logical_name starting with a digit
-- Expected Result: Triggers
-- Dependencies: None
-- =============================================================
-- ERROR: logical_name starting with a digit
entity logical_name_snn_digit is end entity;
architecture rtl of logical_name_snn_digit is
  constant 2bad : string := "bad.dat";  -- ERROR: identifier starts with digit
begin end architecture;