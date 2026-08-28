-- =============================================================
-- Case ID: TC_SIGN_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIGN
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: sign ::= + | -
-- Case Type: Positive
-- Test Focus: Minus sign - used at term level in an expression chain — - is used to modify the second term in an addition chain, verifying the position of sign in simple_expression ::= [ sign ] term { adding_operator term } (sign applies only to the first term)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ent_sign_in_chain is
  port (
    a_i : in  integer range 0 to 100;
    b_i : in  integer range 0 to 100;
    c_i : in  integer range 0 to 100;
    y_o : out integer range -200 to 200
  );
end entity ent_sign_in_chain;

architecture rtl of ent_sign_in_chain is
begin
  y_o <= a_i - b_i + c_i;
end architecture rtl;
