-- =============================================================
-- Case ID: TC_ATTRIBUTE_NAME_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_ATTRIBUTE_NAME
-- Standard Reference: IEEE 1076-2008 Section 8.6
-- Production: attribute_name ::= prefix ' attribute_designator [ ( expression ) ]
-- Case Type: Positive
-- Test Focus: Parameterized attribute_name: A'left(1) with an expression parameter — verifying that after `'` an identifier + parenthesized expression may follow, used for the attribute of a specified dimension of a multidimensional array
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity an_param_ent is port(y:out integer); end entity;
architecture bh of an_param_ent is
  type t_2d is array(0 to 3, 0 to 7) of integer;
  signal s_mat:t_2d:=(others=>(others=>0));
begin
  y<=t_2d'left(1)+t_2d'right(1)+t_2d'low(1)+t_2d'high(1);
end architecture bh;
