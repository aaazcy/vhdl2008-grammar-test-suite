-- =============================================================
-- Case ID: TC_DECIMAL_LITERAL_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_DECIMAL_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 15.5.1
-- Production: decimal_literal ::= integer [ . integer ] [ exponent ]
-- Case Type: Positive
-- Test Focus: Complete three-part decimal_literal(integer . integer exponent) used for physical and real combined assignment
-- Expected Result: Compiles
-- Dependencies: None
-- =============================================================
entity dec_lit_full_form is
  port (
    delay_ns   : out time;
    scale_real : out real
  );
end entity dec_lit_full_form;

architecture rtl of dec_lit_full_form is
  constant C_DELAY    : time := 4.7E3 ns;
  constant C_SCALE    : real := 2.5E-4;
  signal s_ref        : time := 1.0E0 ns;
  signal s_gain       : real := 9.9E1;
begin
  s_ref   <= C_DELAY;
  s_gain  <= C_SCALE;
  delay_ns   <= s_ref;
  scale_real <= s_gain;
end architecture rtl;
