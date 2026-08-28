-- =============================================================
-- Case ID: TC_BASE_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_BASE
-- Standard Reference: IEEE 1076-2008 Section 15.5.3
-- Production: base ::= integer
-- Case Type: Negative
-- Test Focus: base using a non-digit character in place of an integer(A#FF#) — base must be an integer (decimal digit sequence), letter A is not a legal integer value, verify the parser reports an illegal token in the base position
-- Expected Result: Triggers syntax error on non-integer base
-- Dependencies: None
-- =============================================================
entity bs_letter_as_base is
  port (
    bad_val : out integer
  );
end entity bs_letter_as_base;

architecture rtl of bs_letter_as_base is
  constant C_BAD : integer := A#FF#;
begin
  bad_val <= C_BAD;
end architecture rtl;
