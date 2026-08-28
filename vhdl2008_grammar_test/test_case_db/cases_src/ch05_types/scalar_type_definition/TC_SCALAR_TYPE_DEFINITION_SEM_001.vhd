-- =============================================================
-- Case ID: TC_SCALAR_TYPE_DEFINITION_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_SCALAR_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: scalar_type_definition ::= enumeration_type_definition | integer_type_definition | floating_type_definition | physical_type_definition
-- Case Type: Positive
-- Test Focus: SEMANTIC -- scalar types used in arithmetic expressions with type safety
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity std_sem_arithmetic is port(dout:out integer); end entity;
architecture rtl of std_sem_arithmetic is
  type t_val is range 0 to 255;
  signal a:t_val:=10; signal b:t_val:=20; signal r:integer:=0;
begin r<=integer(a)+integer(b); dout<=r; end architecture;