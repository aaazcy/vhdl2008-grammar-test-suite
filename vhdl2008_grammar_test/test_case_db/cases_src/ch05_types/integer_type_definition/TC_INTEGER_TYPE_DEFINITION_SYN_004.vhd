-- =============================================================
-- Case ID: TC_INTEGER_TYPE_DEFINITION_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_INTEGER_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: integer_type_definition ::= range_constraint
-- Case Type: Positive
-- Test Focus: integer_type_definition with range 0 to 255 for byte type
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity itd_syn_byte is port(dout:out integer); end entity;
architecture rtl of itd_syn_byte is
  type t_byte is range 0 to 255;
  signal s:t_byte:=0;
begin
  s<=128; dout<=integer(s);
end architecture rtl;
