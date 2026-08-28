-- =============================================================
-- Case ID: TC_LOGICAL_NAME_LIST_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_LOGICAL_NAME_LIST
-- Standard Reference: IEEE 1076-2008 Section 5.5.1
-- Production: logical_name_list ::= logical_name { , logical_name }
-- Case Type: Positive
-- Test Focus: Positive: logical_name_list with fixed-width string identifiers
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
-- Positive: logical_name_list with fixed-width string identifiers
entity lnl_syn_mixed is port(dout:out integer); end entity;
architecture rtl of lnl_syn_mixed is
  type t_nl is array(0 to 1) of string(1 to 12);
  constant C_NL : t_nl := ("short.dat   ","verylong.dat");
  signal s:integer:=0;
begin s<=1; dout<=s; end architecture;