-- =============================================================
-- Case ID: TC_EXPONENT_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXPONENT
-- Standard Reference: IEEE 1076-2008 Section 15.5.3
-- Production: exponent ::= E [ + ] integer | E - integer
-- Case Type: Positive
-- Test Focus: Three exponent variants (plus / unsigned / minus) used in one architecture, fully verifying parsing of every exponent branch
-- Expected Result: Compiles
-- Dependencies: None
-- =============================================================
entity exp_all_three is
  port (
    pos_out  : out real;
    nos_out  : out real;
    neg_out  : out real
  );
end entity exp_all_three;

architecture rtl of exp_all_three is
  constant C_POS : real := 1.0E+4;
  constant C_NOS : real := 1.0E5;
  constant C_NEG : real := 1.0E-6;
begin
  pos_out <= C_POS;
  nos_out <= C_NOS;
  neg_out <= C_NEG;
end architecture rtl;
