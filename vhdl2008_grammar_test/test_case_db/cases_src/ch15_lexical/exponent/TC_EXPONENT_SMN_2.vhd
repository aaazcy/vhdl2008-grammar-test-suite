-- =============================================================
-- Case ID: TC_EXPONENT_SMN_2
-- Rule Type: Semantic
-- Related Rule ID: BNF_EXPONENT
-- Standard Reference: IEEE 1076-2008 Section 15.5.3
-- Production: exponent ::= E [ + ] integer | E - integer
-- Case Type: Negative
-- Test Focus: Exponent too large causing real overflow — syntactically legal but semantically the value exceeds the representable range of type real
-- Expected Result: Triggers error
-- Dependencies: None
-- =============================================================
entity exp_sem_001 is
  port (
    val_out : out real
  );
end entity exp_sem_001;

architecture rtl of exp_sem_001 is
  constant C_HUGE : real := 1.0E400;
begin
  val_out <= C_HUGE;
end architecture rtl;
