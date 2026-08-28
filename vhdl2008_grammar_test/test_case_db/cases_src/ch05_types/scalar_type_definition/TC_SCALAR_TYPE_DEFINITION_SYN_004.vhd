-- =============================================================
-- Case ID: TC_SCALAR_TYPE_DEFINITION_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_SCALAR_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: scalar_type_definition ::= enumeration_type_definition | integer_type_definition | floating_type_definition | physical_type_definition
-- Case Type: Positive
-- Test Focus: scalar_type_definition as enumeration: type t_state is (IDLE, RUN, STOP)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity std_syn_enum is port(dout:out integer); end entity;
architecture rtl of std_syn_enum is
  type t_state is (IDLE,RUN,STOP);
  signal s:t_state:=IDLE;
begin s<=RUN after 1 ns; dout<=0; end architecture;