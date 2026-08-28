-- =============================================================
-- Case ID: TC_ABSTRACT_LITERAL_SYN_S01
-- Rule Type: Syntax
-- BNF Production: ABSTRACT_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 15.5
-- Test Focus: Abstract literal: decimal_literal or based_literal — optional integer or real numeric literal
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_abstract_literal_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_abstract_literal_syn_s01 is
  constant C_INT:integer:=42;
  constant C_REAL:real:=3.14159;
begin
  r<=C_INT;end architecture bh;
