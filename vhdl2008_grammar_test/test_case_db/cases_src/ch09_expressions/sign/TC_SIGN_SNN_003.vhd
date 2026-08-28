-- =============================================================
-- Case ID: TC_SIGN_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIGN
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: sign ::= + | -
-- Case Type: Negative
-- Test Focus: SNN: two consecutive signs with no operand — in the expression "- + a_i" the two signs - and + appear consecutively, verifying that the BNF allows only one optional [ sign ] prefix, two consecutive signs are a syntax error (use parentheses for double negation)
-- Expected Result: Triggers syntax error: consecutive signs without operand between them
-- Dependencies: None
-- =============================================================
entity ent_snn_double_sign is
  port (
    a_i : in  integer;
    y_o : out integer
  );
end entity ent_snn_double_sign;

architecture rtl of ent_snn_double_sign is
begin
  -- ERROR: two consecutive signs without operand
  y_o <= - + a_i;
end architecture rtl;
