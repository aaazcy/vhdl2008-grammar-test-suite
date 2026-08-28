-- =============================================================
-- Case ID: TC_LOGICAL_NAME_LIST_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_LOGICAL_NAME_LIST
-- Standard Reference: IEEE 1076-2008 Section 5.5.1
-- Production: logical_name_list ::= logical_name { , logical_name }
-- Case Type: Negative
-- Test Focus: ERROR: trailing comma in list without following element
-- Expected Result: Triggers
-- Dependencies: None
-- =============================================================
-- ERROR: trailing comma in list without following element
entity lnl_snn_trailing_comma is end entity;
architecture rtl of lnl_snn_trailing_comma is
  type t_arr is array(0 to 1) of string(1 to 5);
  constant C_BAD : t_arr := ("a.dat",);  -- ERROR: trailing comma
begin end architecture;