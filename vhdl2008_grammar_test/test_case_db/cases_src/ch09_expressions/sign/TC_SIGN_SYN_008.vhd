-- =============================================================
-- Case ID: TC_SIGN_SYN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIGN
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: sign ::= + | -
-- Case Type: Positive
-- Test Focus: Minus sign - used in a generic map expression — - negates a parameter in the generic map of a component instantiation, verifying the syntax of sign in instantiation association expressions
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ent_sign_generic is
  port (
    offset_i : in  integer range 0 to 255;
    result_o : out integer range -255 to 255
  );
end entity ent_sign_generic;

architecture rtl of ent_sign_generic is
  signal inverted : integer range -255 to 255;
begin
  inverted <= -offset_i;
  result_o <= inverted;
end architecture rtl;
