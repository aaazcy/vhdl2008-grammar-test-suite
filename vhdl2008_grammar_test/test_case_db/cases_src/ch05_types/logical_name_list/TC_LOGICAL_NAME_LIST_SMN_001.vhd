-- =============================================================
-- Case ID: TC_LOGICAL_NAME_LIST_SMN_001
-- Rule Type: Static Model
-- Related Rule ID: BNF_LOGICAL_NAME_LIST
-- Standard Reference: IEEE 1076-2008 Section 5.5.1
-- Production: logical_name_list ::= logical_name { , logical_name }
-- Case Type: Negative
-- Test Focus: ERROR: logical_name_list with duplicate entries causing ambiguity
-- Expected Result: Triggers
-- Dependencies: None
-- =============================================================
-- ERROR: logical_name_list with duplicate entries causing ambiguity
entity lnl_smn_duplicate is port(dout:out integer); end entity;
architecture rtl of lnl_smn_duplicate is
  type t_names is array(0 to 1) of string(1 to 10);
  constant C_DUP : t_names := ("same.dat","same.dat");  -- ERROR: duplicate file names
begin dout<=0; end architecture;