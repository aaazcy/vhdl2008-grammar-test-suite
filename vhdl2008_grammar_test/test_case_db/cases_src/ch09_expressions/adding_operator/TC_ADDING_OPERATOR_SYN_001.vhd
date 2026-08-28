-- =============================================================
-- Case ID: TC_ADDING_OPERATOR_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_ADDING_OPERATOR
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: adding_operator ::= + | - | &
-- Case Type: Positive
-- Test Focus: Three adding operators: arithmetic plus (+) and minus (-) and concatenation (&, bit_vector+bit/bit_vector+bit_vector), verifying the use of adding_operator addition, subtraction and concatenation in expressions
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ao_ent is port(a,b:in integer; v1,v2:in bit_vector(3 downto 0); y:out integer; cat:out bit_vector(7 downto 0)); end entity;
architecture bh of ao_ent is
  signal s_sum,s_diff:integer:=0; signal s_cat:bit_vector(7 downto 0);
begin
  s_sum<=a+b; s_diff<=a-b; s_cat<=v1 & v2;
  y<=s_sum+s_diff; cat<=s_cat;
end architecture bh;
