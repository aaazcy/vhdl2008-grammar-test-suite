-- =============================================================
-- Case ID: TC_INTEGER_TYPE_DEFINITION_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_INTEGER_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: integer_type_definition ::= range_constraint
-- Case Type: Positive
-- Test Focus: integer_type_definition with large range 0 to 65535 for address type
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity itd_syn_addr is port(dout:out integer); end entity;
architecture rtl of itd_syn_addr is
  type t_addr is range 0 to 65535;
  signal s:t_addr:=0;
begin
  s<=1024; dout<=integer(s);
end architecture rtl;
