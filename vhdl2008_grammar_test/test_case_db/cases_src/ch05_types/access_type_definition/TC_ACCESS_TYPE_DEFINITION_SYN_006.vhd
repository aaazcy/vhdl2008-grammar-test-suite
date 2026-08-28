-- =============================================================
-- Case ID: TC_ACCESS_TYPE_DEFINITION_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_ACCESS_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.4.1
-- Production: access_type_definition ::= access subtype_indication
-- Case Type: Positive
-- Test Focus: access type pointing to an integer subtype with range constraint
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity atd_syn_int_subtype is port(dout:out integer); end entity;
architecture rtl of atd_syn_int_subtype is
  subtype t_byte is integer range 0 to 255;
  type t_byte_ptr is access t_byte;
begin process variable sv:t_byte_ptr; begin sv:=new t_byte'(128); dout<=sv.all; wait; end process; end architecture;