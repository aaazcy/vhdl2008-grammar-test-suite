-- =============================================================
-- Case ID: TC_ABSTRACT_LITERAL_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_ABSTRACT_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 15.5
-- Production: abstract_literal ::= decimal_literal | based_literal
-- Case Type: Positive
-- Test Focus: Abstract literal decimal and based forms: integer(42, 1_000_000 underscore grouping)/real(3.14159, 1.0e-10 exponent)/based(2#1010#, 16#FF_EE#), verify all formats of decimal_literal and based_literal of abstract_literal used in constant/signal default values
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity al_ent is port(y:out integer); end entity;
architecture bh of al_ent is
  constant C_INT:integer:=42;
  constant C_BIG:integer:=1_000_000;
  constant C_BIN:integer:=2#1010_1010#;
  constant C_HEX:integer:=16#FF_EE#;
  signal s_sum:integer:=0;
begin
  s_sum<=C_INT+C_BIG+C_BIN+C_HEX; y<=s_sum;
end architecture bh;
