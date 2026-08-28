-- =============================================================
-- Case ID: TC_BASE_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_BASE
-- Standard Reference: IEEE 1076-2008 Section 15.5.3
-- Production: base ::= integer
-- Case Type: Negative
-- Test Focus: base using 0 as the radix(0#FF#) — base must be an integer in the [2..16] range, 0 is not in the allowed range, verify the parser rejects the based_literal with base=0
-- Expected Result: Triggers syntax/semantic error on base=0
-- Dependencies: None
-- =============================================================
entity bs_base_zero is
  port (
    bad_val : out integer
  );
end entity bs_base_zero;

architecture rtl of bs_base_zero is
  constant C_BAD : integer := 0#FF#;
begin
  bad_val <= C_BAD;
end architecture rtl;
