-- =============================================================
-- Case ID: TC_ADDING_OPERATOR_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_ADDING_OPERATOR
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: adding_operator ::= + | - | &
-- Case Type: Negative
-- Test Focus: SNN: missing the term to the left of the & operator - the expression "& vec_i" starts with & but has no preceding operand, verifying that adding_operator must be a binary operator between two terms in simple_expression and cannot be used as a unary operator or lack a left operand
-- Expected Result: Triggers syntax error: missing left operand for &
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity ent_missing_lhs is
  port (
    vec_i : in  std_logic_vector(3 downto 0);
    y_o   : out std_logic_vector(3 downto 0)
  );
end entity ent_missing_lhs;

architecture rtl of ent_missing_lhs is
begin
  -- ERROR: missing left operand for concatenation operator &
  y_o <= & vec_i;
end architecture rtl;
