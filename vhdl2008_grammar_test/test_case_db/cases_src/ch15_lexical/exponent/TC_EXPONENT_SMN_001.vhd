-- =============================================================
-- Case ID: TC_EXPONENT_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_EXPONENT
-- Standard Reference: IEEE 1076-2008 Section 15.5.3
-- Production: exponent ::= E [ + ] integer | E - integer
-- Case Type: Negative
-- Test Focus: Negative integer in exponent (minus sign + negative integer) — only a positive integer value may follow E -, with no further sign ambiguity
-- Expected Result: Triggers error
-- Dependencies: None
-- =============================================================
entity exp_smn_001 is
  port (
    val_out : out real
  );
end entity exp_smn_001;

architecture rtl of exp_smn_001 is
  constant C_BAD : real := 1.0E-;
begin
  val_out <= C_BAD;
end architecture rtl;
