-- =============================================================
-- Case ID: TC_LOGICAL_NAME_LIST_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_LOGICAL_NAME_LIST
-- Standard Reference: IEEE 1076-2008 Section 5.5.1
-- Production: logical_name_list ::= logical_name { , logical_name }
-- Case Type: Positive
-- Test Focus: Positive: empty logical_name_list (all entries optional in context)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
-- Positive: empty logical_name_list (all entries optional in context)
entity lnl_syn_empty_list is port(dout:out integer); end entity;
architecture rtl of lnl_syn_empty_list is
  type t_nl is array(0 to -1) of string(1 to 0);
  constant C_EMPTY : t_nl := (others => "");
  signal s:integer:=0;
begin s<=0; dout<=s; end architecture;