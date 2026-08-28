-- =============================================================
-- Case ID: TC_CONSTRAINT_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONSTRAINT
-- Standard Reference: IEEE 1076-2008 Section 5.3.2
-- Production: constraint ::= range_constraint | array_constraint | record_constraint
-- Case Type: Positive
-- Test Focus: constraint as array_constraint with single index on vector type
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity con_syn_array is port(dout:out integer); end entity;
architecture rtl of con_syn_array is
  type t_vec is array(integer range <>) of integer;
  subtype t_vec8 is t_vec(0 to 7);
  signal s:t_vec8:=(others=>0);
begin s(0)<=42; dout<=s(0); end architecture;