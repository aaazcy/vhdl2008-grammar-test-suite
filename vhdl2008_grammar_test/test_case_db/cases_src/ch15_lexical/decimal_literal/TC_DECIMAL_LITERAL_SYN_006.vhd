-- =============================================================
-- Case ID: TC_DECIMAL_LITERAL_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_DECIMAL_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 15.5.1
-- Production: decimal_literal ::= integer [ . integer ] [ exponent ]
-- Case Type: Positive
-- Test Focus: Multiple decimal_literal forms mixed in signal assignment and subtype definition, verify parse consistency of the different combinations
-- Expected Result: Compiles
-- Dependencies: None
-- =============================================================
entity dec_lit_mixed_forms is
  port (
    a : out real;
    b : out real;
    c : out real;
    d : out integer
  );
end entity dec_lit_mixed_forms;

architecture rtl of dec_lit_mixed_forms is
  constant C_PI     : real    := 3.14159;
  constant C_AVOGADRO : real := 6.022E23;
  constant C_ZERO   : real    := 0.0;
  constant C_COUNT   : integer := 255;
  signal s_prod      : real    := 1.0;
begin
  s_prod <= C_PI * C_ZERO;
  a <= C_PI;
  b <= C_AVOGADRO;
  c <= s_prod;
  d <= C_COUNT;
end architecture rtl;
