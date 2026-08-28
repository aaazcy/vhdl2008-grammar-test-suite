-- =============================================================
-- Case ID: TC_SIGN_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIGN
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: sign ::= + | -
-- Case Type: Positive
-- Test Focus: Minus sign - used to negate real floating-point values — a negative real input becomes a positive output after the - sign operation, verifying the application of - as sign on floating-point types
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ent_neg_real is
  port (
    a_i : in  real range -100.0 to 100.0;
    y_o : out real range -100.0 to 100.0
  );
end entity ent_neg_real;

architecture rtl of ent_neg_real is
begin
  y_o <= -a_i;
end architecture rtl;
