-- =============================================================
-- Case ID: TC_BASE_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_BASE
-- Standard Reference: IEEE 1076-2008 Section 15.5.3
-- Production: base ::= integer
-- Case Type: Negative
-- Test Focus: SNN: base of based_literal is 0 — in 0#1010# the base is 0, the base of based_literal must be an integer no less than 2
-- Expected Result: Triggers analysis error: base must be at least 2
-- Dependencies: None
-- =============================================================
entity base_zero is
  port (
    bad_val : out integer
  );
end entity base_zero;

architecture vhdl2008 of base_zero is
  constant C_BAD : integer := 0#1010#;
begin
  bad_val <= 0;
end architecture vhdl2008;
