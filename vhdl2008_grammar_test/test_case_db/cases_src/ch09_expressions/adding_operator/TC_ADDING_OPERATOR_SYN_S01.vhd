-- =============================================================
-- Case ID: TC_ADDING_OPERATOR_SYN_S01
-- Rule Type: Syntax
-- BNF Production: ADDING_OPERATOR
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Test Focus: Adding operator: + ｜ - ｜ & — addition, subtraction, concatenation operators
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_adding_operator_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_adding_operator_syn_s01 is
  signal s_a,s_b,s_c:integer:=0;
  signal s_v1,s_v2:bit_vector(3 downto 0):="0000";
  signal s_concat:bit_vector(7 downto 0);
begin
  s_c<=s_a+s_b;  -- +
  s_a<=s_b-s_c;  -- -
  s_concat<=s_v1&s_v2;  -- &
  r<=s_c;end architecture bh;
