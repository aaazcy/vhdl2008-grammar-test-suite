-- =============================================================
-- Case ID: TC_TYPE_DECLARATION_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_TYPE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.2
-- Production: type_declaration ::= full_type_declaration | incomplete_type_declaration
-- Case Type: Positive
-- Test Focus: type declaration of an enumeration with four values
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity td_syn_enum is port(dout:out integer); end entity;
architecture rtl of td_syn_enum is
  type t_op is (NOP,LOAD,STORE,ADD);
  signal s:t_op:=NOP;
begin s<=ADD after 1 ns; dout<=0; end architecture;