-- =============================================================
-- Case ID: TC_LOGICAL_NAME_LIST_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_LOGICAL_NAME_LIST
-- Standard Reference: IEEE 1076-2008 Section 5.5.1
-- Production: logical_name_list ::= logical_name { , logical_name }
-- Case Type: Negative
-- Test Focus: ERROR: missing comma between list elements
-- Expected Result: Triggers
-- Dependencies: None
-- =============================================================
-- ERROR: missing comma between list elements
entity lnl_snn_missing_comma is end entity;
architecture rtl of lnl_snn_missing_comma is
  type t_arr is array(0 to 2) of string(1 to 5);
  constant C_BAD : t_arr := ("a.dat" "b.dat" "c.dat");  -- ERROR: missing commas
begin end architecture;