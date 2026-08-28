-- =============================================================
-- Case ID: TC_LOGICAL_NAME_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_LOGICAL_NAME
-- Standard Reference: IEEE 1076-2008 Section 5.5.1
-- Production: logical_name ::= identifier
-- Case Type: Negative
-- Test Focus: ERROR: logical_name with invalid characters (spaces in basic identifier)
-- Expected Result: Triggers
-- Dependencies: None
-- =============================================================
-- ERROR: logical_name with invalid characters (spaces in basic identifier)
entity logical_name_snn_spaces is end entity;
architecture rtl of logical_name_snn_spaces is
  constant my file : string := "bad.dat";  -- ERROR: space in identifier
begin end architecture;