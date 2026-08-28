-- =============================================================
-- Case ID: TC_EXPONENT_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXPONENT
-- Standard Reference: IEEE 1076-2008 Section 15.5.3
-- Production: exponent ::= E [ + ] integer | E - integer
-- Case Type: Positive
-- Test Focus: Exponent of the form E integer (unsigned) — when the plus sign is omitted an integer directly follows E, testing omission of [ + ] in E [ + ] integer
-- Expected Result: Compiles
-- Dependencies: None
-- =============================================================
entity exp_no_sign is
  port (
    val_out : out real
  );
end entity exp_no_sign;

architecture rtl of exp_no_sign is
  constant C_GIGA  : real := 3.0E9;
  constant C_CENTI : real := 5.0E2;
  signal s_prod    : real := 0.0;
begin
  s_prod  <= C_GIGA * C_CENTI;
  val_out <= s_prod;
end architecture rtl;
