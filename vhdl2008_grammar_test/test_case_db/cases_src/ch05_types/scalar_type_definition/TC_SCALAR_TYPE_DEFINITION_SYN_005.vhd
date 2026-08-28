-- =============================================================
-- Case ID: TC_SCALAR_TYPE_DEFINITION_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_SCALAR_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: scalar_type_definition ::= enumeration_type_definition | integer_type_definition | floating_type_definition | physical_type_definition
-- Case Type: Positive
-- Test Focus: scalar_type_definition as integer with range constraint
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity std_syn_int is port(dout:out integer); end entity;
architecture rtl of std_syn_int is
  type t_addr is range 0 to 1023;
  signal s:t_addr:=0;
begin s<=512; dout<=integer(s); end architecture;