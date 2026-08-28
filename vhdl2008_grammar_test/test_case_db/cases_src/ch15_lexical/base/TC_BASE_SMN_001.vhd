-- =============================================================
-- Case ID: TC_BASE_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_BASE
-- Standard Reference: IEEE 1076-2008 Section 15.5.3
-- Production: base ::= integer
-- Case Type: Negative
-- Test Focus: SMN: base of based_literal beyond the upper limit — in 17#1010# the base is 17, the base of based_literal must be between 2 and 16
-- Expected Result: Triggers analysis error: base must be at most 16
-- Dependencies: None
-- =============================================================
entity base_too_large is
  port (
    bad_val : out integer
  );
end entity base_too_large;

architecture vhdl2008 of base_too_large is
  constant C_BAD : integer := 17#1010#;
begin
  bad_val <= 0;
end architecture vhdl2008;
