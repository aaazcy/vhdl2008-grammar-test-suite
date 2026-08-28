-- =============================================================
-- Case ID: TC_SCALAR_TYPE_DEFINITION_SYN_S01
-- Rule Type: Syntax
-- BNF Production: SCALAR_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.2
-- Test Focus: Scalar type definition: enumeration ｜ integer ｜ floating ｜ physical
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_scalar_type_definition_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_scalar_type_definition_syn_s01 is
  type t_e is (A,B,C,D); type t_i is range 0 to 255;
  type t_f is range 0.0 to 1.0; type t_p is range 0 to 1000 units u; end units;
  signal s_e:t_e:=A; signal s_i:t_i:=0;
begin
  s_i<=255; r<=integer(s_i);end architecture bh;
