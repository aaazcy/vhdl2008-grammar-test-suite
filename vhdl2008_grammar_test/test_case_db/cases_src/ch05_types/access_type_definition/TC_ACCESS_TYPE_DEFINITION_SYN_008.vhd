-- =============================================================
-- Case ID: TC_ACCESS_TYPE_DEFINITION_SYN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_ACCESS_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.4.1
-- Production: access_type_definition ::= access subtype_indication
-- Case Type: Positive
-- Test Focus: access type with deallocation pattern (null assignment)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity atd_syn_dealloc is port(dout:out integer); end entity;
architecture rtl of atd_syn_dealloc is
  type t_int_ptr is access integer;
begin process variable sv:t_int_ptr; begin sv:=new integer'(42); dout<=sv.all; sv:=null; wait; end process; end architecture;