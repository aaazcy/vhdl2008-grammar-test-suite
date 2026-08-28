-- =============================================================
-- Case ID: TC_SIMPLE_EXPRESSION_SYN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIMPLE_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: simple_expression ::= [ sign ] term { adding_operator term }
-- Case Type: Positive
-- Test Focus: All three adding_operators coexist: + / - / & used in the same simple_expression chain
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sexpr_all_ops_ent is
  port(a : in bit; b : in bit_vector(2 downto 0); c : in bit_vector(3 downto 0); y : out bit_vector(7 downto 0));
end entity;
architecture rtl of sexpr_all_ops_ent is
begin
  y <= c & (b & a);
end architecture rtl;
