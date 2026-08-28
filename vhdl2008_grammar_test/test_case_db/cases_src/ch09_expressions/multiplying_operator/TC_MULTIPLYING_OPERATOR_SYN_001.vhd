-- =============================================================
-- Case ID: TC_MULTIPLYING_OPERATOR_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_MULTIPLYING_OPERATOR
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: multiplying_operator ::= * | / | mod | rem
-- Case Type: Positive
-- Test Focus: all four multiplying operators: multiply(*)/divide(/)/modulo(mod)/remainder(rem) all used, verifying the precedence (higher than plus and minus) and combined use of the four arithmetic multiplying operators of multiplying_operator in an expression chain
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity mo_ent is port(a,b:in integer; y:out integer); end entity;
architecture bh of mo_ent is
  signal s_mul,s_div,s_mod,s_rem:integer:=0;
begin
  s_mul<=a*b; s_div<=a/b; s_mod<=a mod b; s_rem<=a rem b;
  y<=s_mul+s_div+s_mod+s_rem;
end architecture bh;
