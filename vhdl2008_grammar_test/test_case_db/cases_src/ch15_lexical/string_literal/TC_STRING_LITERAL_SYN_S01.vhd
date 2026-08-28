-- =============================================================
-- Case ID: TC_STRING_LITERAL_SYN_S01
-- Rule Type: Syntax
-- BNF Production: STRING_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 15.7
-- Test Focus: String literal: " {graphic_character} " — double-quoted character sequence for strings/bit vectors
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_string_literal_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_string_literal_syn_s01 is
  constant C_STR:string:="Hello VHDL";
  constant C_BITS:bit_vector:= "01010101";
begin
  r<=42;end architecture bh;
