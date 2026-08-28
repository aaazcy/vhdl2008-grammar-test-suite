-- =============================================================
-- Case ID: TC_LOGICAL_OPERATOR_SYN_S01
-- Rule Type: Syntax
-- BNF Production: LOGICAL_OPERATOR
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Test Focus: Logical operator: and ｜ or ｜ nand ｜ nor ｜ xor ｜ xnor — all 6 logical operators
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_logical_operator_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_logical_operator_syn_s01 is
  signal s_a,s_b:bit:='0'; signal s_and,s_or,s_xor,s_nand:bit;
begin
  s_and<=s_a and s_b; s_or<=s_a or s_b;
  s_xor<=s_a xor s_b; s_nand<=s_a nand s_b;
  r<=1 when s_and='1' else 0;end architecture bh;
