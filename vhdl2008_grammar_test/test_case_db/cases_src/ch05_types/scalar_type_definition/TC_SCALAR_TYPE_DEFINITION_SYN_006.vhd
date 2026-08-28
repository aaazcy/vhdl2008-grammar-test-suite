-- =============================================================
-- Case ID: TC_SCALAR_TYPE_DEFINITION_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_SCALAR_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: scalar_type_definition ::= enumeration_type_definition | integer_type_definition | floating_type_definition | physical_type_definition
-- Case Type: Positive
-- Test Focus: scalar_type_definition as floating with range constraint
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity std_syn_float is port(dout:out integer); end entity;
architecture rtl of std_syn_float is
  type t_gain is range -1.0 to 1.0;
  signal s:t_gain:=0.0;
begin s<=0.5; dout<=0; end architecture;