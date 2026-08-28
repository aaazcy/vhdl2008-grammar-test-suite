-- =============================================================
-- Case ID: TC_TYPE_DECLARATION_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_TYPE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.2
-- Production: type_declaration ::= full_type_declaration | incomplete_type_declaration
-- Case Type: Positive
-- Test Focus: type declaration of an integer subtype with range
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity td_syn_int is port(dout:out integer); end entity;
architecture rtl of td_syn_int is
  type t_cnt is range 0 to 65535;
  signal s:t_cnt:=0;
begin s<=s+1 after 1 ns; dout<=integer(s); end architecture;