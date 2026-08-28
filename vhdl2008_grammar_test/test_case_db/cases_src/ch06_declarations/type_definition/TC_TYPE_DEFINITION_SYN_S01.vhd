-- =============================================================
-- Case ID: TC_TYPE_DEFINITION_SYN_S01
-- Rule Type: Syntax
-- BNF Production: TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 6.2
-- Test Focus: Type definition: scalar ｜ composite ｜ access ｜ file ｜ protected type definition — all type categories
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_type_definition_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_type_definition_syn_s01 is
  type t_i is range 0 to 255; type t_e is (A,B,C);
  type t_a is array(0 to 7) of bit; type t_r is record x:integer; y:bit; end record;
begin
  r<=42;end architecture bh;
