-- =============================================================
-- Case ID: TC_LOGICAL_NAME_SNN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_LOGICAL_NAME
-- Standard Reference: IEEE 1076-2008 Section 5.5.1
-- Production: logical_name ::= identifier
-- Case Type: Negative
-- Test Focus: Syntax error -- logical_name containing underscore at start (illegal basic identifier)
-- Expected Result: Triggers
-- Dependencies: None
-- =============================================================
entity log_name_snn_underscore is end entity;
architecture rtl of log_name_snn_underscore is
  constant _bad : string := "file.dat";  -- ERROR: leading underscore not followed by letter_or_digit
begin end architecture;