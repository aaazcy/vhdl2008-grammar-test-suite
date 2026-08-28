-- =============================================================
-- Case ID: TC_BASED_LITERAL_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_BASED_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 15.5.2
-- Production: based_literal ::= base # based_integer [ . based_integer ] # [ exponent ]
-- Case Type: Positive
-- Test Focus: Based literal all radices + floating point + exponent: all 4 bases 2/8/10/16, with underscore grouping(16#FF_EE#)/floating point(2#101.11#)/exponent(16#F.FF#E+2), verify all legal format variants of based_literal
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity bl_ent is port(y:out integer); end entity;
architecture bh of bl_ent is
  constant C_BIN:integer:=2#1010_1010#;
  constant C_OCT:integer:=8#377#;
  constant C_DEC:integer:=10#255#;
  constant C_HEX:integer:=16#FF_EE#;
  signal s_sum:integer:=0;
begin
  s_sum<=C_BIN+C_OCT+C_DEC+C_HEX;
  y<=s_sum;
end architecture bh;
