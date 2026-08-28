-- =============================================================
-- Case ID: TC_LOGICAL_NAME_LIST_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_LOGICAL_NAME_LIST
-- Standard Reference: IEEE 1076-2008 Section 5.5.1
-- Production: logical_name_list ::= logical_name { , logical_name }
-- Case Type: Positive
-- Test Focus: Positive: logical_name_list with three comma-separated names
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
-- Positive: logical_name_list with three comma-separated names
entity lnl_syn_triple is port(dout:out integer); end entity;
architecture rtl of lnl_syn_triple is
  type t_name_list is array(0 to 2) of string(1 to 10);
  constant C_LIST : t_name_list := ("input.dat ","output.dat","log.dat   ");
  signal s:integer:=0;
begin s<=C_LIST'length; dout<=s; end architecture;