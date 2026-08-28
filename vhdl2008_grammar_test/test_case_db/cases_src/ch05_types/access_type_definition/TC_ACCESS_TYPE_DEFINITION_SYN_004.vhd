-- =============================================================
-- Case ID: TC_ACCESS_TYPE_DEFINITION_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_ACCESS_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.4.1
-- Production: access_type_definition ::= access subtype_indication
-- Case Type: Positive
-- Test Focus: access type pointing to a constrained array subtype
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity atd_syn_arr is port(dout:out integer); end entity;
architecture rtl of atd_syn_arr is
  type t_vec is array(0 to 7) of integer;
  type t_vec_ptr is access t_vec;
begin process variable sv:t_vec_ptr; begin sv:=new t_vec'(others=>0); dout<=0; wait; end process; end architecture;