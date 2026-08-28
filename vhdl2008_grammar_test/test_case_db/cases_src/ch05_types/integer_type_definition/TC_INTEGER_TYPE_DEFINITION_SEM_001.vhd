-- =============================================================
-- Case ID: TC_INTEGER_TYPE_DEFINITION_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_INTEGER_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: integer_type_definition ::= range_constraint
-- Case Type: Positive
-- Test Focus: SEMANTIC -- integer type used in arithmetic expressions with range safety
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity itd_sem_arithmetic is port(dout:out integer); end entity;
architecture rtl of itd_sem_arithmetic is
  type t_u8 is range 0 to 255;
  signal a:t_u8:=100; signal b:t_u8:=50; signal r:integer:=0;
begin
  r<=integer(a)+integer(b);
  dout<=r;
end architecture rtl;
