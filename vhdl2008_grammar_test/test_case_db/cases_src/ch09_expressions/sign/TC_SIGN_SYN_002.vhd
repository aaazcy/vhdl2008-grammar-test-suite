-- =============================================================
-- Case ID: TC_SIGN_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIGN
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: sign ::= + | -
-- Case Type: Positive
-- Test Focus: Plus sign + used on integer to keep the sign — applying unary + to the input keeps the value unchanged, verifying the unary plus syntax of + as sign in simple_expression
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ent_pos_int is
  port (
    a_i : in  integer range 0 to 255;
    y_o : out integer range 0 to 255
  );
end entity ent_pos_int;

architecture rtl of ent_pos_int is
begin
  y_o <= +a_i;
end architecture rtl;
