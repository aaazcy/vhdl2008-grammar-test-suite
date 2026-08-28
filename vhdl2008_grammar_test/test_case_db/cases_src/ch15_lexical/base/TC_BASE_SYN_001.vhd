-- =============================================================
-- Case ID: TC_BASE_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_BASE
-- Standard Reference: IEEE 1076-2008 Section 15.5.3
-- Production: base ::= integer
-- Case Type: Positive
-- Test Focus: base using the minimum allowed value 2 (binary base) in based_literal(2#1010#) verify the legal syntax of base=2 as a binary base
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity bs_base_min_value is
  port (
    out_val : out integer
  );
end entity bs_base_min_value;

architecture rtl of bs_base_min_value is
  constant C_BIN : integer := 2#1010#;
begin
  out_val <= C_BIN;
end architecture rtl;
