-- =============================================================
-- Case ID: TC_SIMPLE_EXPRESSION_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIMPLE_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: simple_expression ::= [ sign ] term { adding_operator term }
-- Case Type: Positive
-- Test Focus: term & term concatenation: two terms joined by &, used for bit_vector concatenation
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sexpr_concat_ent is
  port(high : in bit_vector(3 downto 0); low : in bit_vector(3 downto 0); combined : out bit_vector(7 downto 0));
end entity;
architecture rtl of sexpr_concat_ent is
begin
  combined <= high & low;
end architecture rtl;
