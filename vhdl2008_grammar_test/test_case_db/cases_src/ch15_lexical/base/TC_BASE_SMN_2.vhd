-- =============================================================
-- Case ID: TC_BASE_SMN_2
-- Rule Type: Semantic
-- Related Rule ID: BNF_BASE
-- Standard Reference: IEEE 1076-2008 Section 15.5.3
-- Production: base ::= integer
-- Case Type: Negative
-- Test Focus: base value 17 beyond the VHDL allowed radix range [2..16]: in 17#FF# base=17 is greater than the upper bound 16, verify semantic analysis detects the base value out of range and reports a range error
-- Expected Result: Triggers semantic error on base > 16
-- Dependencies: None
-- =============================================================
entity bs_base_seventeen is
  port (
    bad_val : out integer
  );
end entity bs_base_seventeen;

architecture rtl of bs_base_seventeen is
  constant C_BAD : integer := 17#FF#;
begin
  bad_val <= C_BAD;
end architecture rtl;
