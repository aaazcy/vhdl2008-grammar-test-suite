-- =============================================================
-- Case ID: TC_ADDING_OPERATOR_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_ADDING_OPERATOR
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: adding_operator ::= + | - | &
-- Case Type: Positive
-- Test Focus: Mixed chained expression of + and - - a consecutive adding_operator chain of the form a + b - c in simple_expression, verifying the legal combination of multiple adding_operators in a single expression
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ent_chain_addsub is
  port (
    a_i : in  integer range -128 to 127;
    b_i : in  integer range -128 to 127;
    c_i : in  integer range -128 to 127;
    y_o : out integer range -384 to 382
  );
end entity ent_chain_addsub;

architecture rtl of ent_chain_addsub is
begin
  y_o <= a_i + b_i - c_i;
end architecture rtl;
