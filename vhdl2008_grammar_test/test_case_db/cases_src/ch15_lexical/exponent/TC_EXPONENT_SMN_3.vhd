-- =============================================================
-- Case ID: TC_EXPONENT_SMN_3
-- Rule Type: Semantic
-- Related Rule ID: BNF_EXPONENT
-- Standard Reference: IEEE 1076-2008 Section 15.5.3
-- Production: exponent ::= E [ + ] integer | E - integer
-- Case Type: Negative
-- Test Focus: Real literal with exponent used in integer subtype constraint — the exponent produces a floating-point value that cannot be used as a discrete range boundary
-- Expected Result: Triggers error
-- Dependencies: None
-- =============================================================
entity exp_sem_002 is
  port (
    val_out : out integer
  );
end entity exp_sem_002;

architecture rtl of exp_sem_002 is
  subtype T_BAD is integer range 0 to 1.0E3;
  signal s_val : T_BAD := 0;
begin
  val_out <= s_val;
end architecture rtl;
