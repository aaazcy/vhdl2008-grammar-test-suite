-- =============================================================
-- Case ID: TC_SIGN_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIGN
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: sign ::= + | -
-- Case Type: Positive
-- Test Focus: Minimal form: minus sign - used to negate an integer — output the negative value of the input integer, verifying the minimal unary minus syntax of sign as [ sign ] term in simple_expression
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ent_neg_int is
  port (
    a_i : in  integer range -128 to 127;
    y_o : out integer range -127 to 128
  );
end entity ent_neg_int;

architecture rtl of ent_neg_int is
begin
  y_o <= -a_i;
end architecture rtl;
