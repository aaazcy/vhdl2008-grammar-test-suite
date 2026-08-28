-- =============================================================
-- Case ID: TC_INTEGER_TYPE_DEFINITION_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_INTEGER_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: integer_type_definition ::= range_constraint
-- Case Type: Positive
-- Test Focus: integer_type_definition with signed range -128 to 127
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity itd_syn_signed is port(dout:out integer); end entity;
architecture rtl of itd_syn_signed is
  type t_s8 is range -128 to 127;
  signal s:t_s8:=0;
begin
  s<=64; dout<=integer(s);
end architecture rtl;
