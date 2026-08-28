-- =============================================================
-- Case ID: TC_RELATIONAL_OPERATOR_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_RELATIONAL_OPERATOR
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: relational_operator ::= = | /= | < | <= | > | >= | ?= | ?/= | ?< | ?<= | ?> | ?>=
-- Case Type: Positive
-- Test Focus: = and /= equality and inequality comparison——two unsigned inputs are compared for equality and inequality to produce two independent bit outputs, verifying the syntax of the basic equality/inequality relational_operator in concurrent signal assignments
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.numeric_std.all;

entity ent_eq_neq is
  port (
    a_i    : in  unsigned(3 downto 0);
    b_i    : in  unsigned(3 downto 0);
    eq_o   : out bit;
    neq_o  : out bit
  );
end entity ent_eq_neq;

architecture rtl of ent_eq_neq is
begin
  eq_o  <= '1' when a_i = b_i else '0';
  neq_o <= '1' when a_i /= b_i else '0';
end architecture rtl;
