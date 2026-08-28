-- =============================================================
-- Case ID: TC_BASE_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: BNF_BASE
-- Standard Reference: IEEE 1076-2008 Section 15.5.3
-- Production: base ::= integer
-- Case Type: Negative
-- Test Focus: base value 1 below the VHDL allowed radix range [2..16]: in 1#0# base=1 is less than the lower bound 2, verify semantic analysis rejects radix 1 and reports an invalid radix error
-- Expected Result: Triggers semantic error on base < 2
-- Dependencies: None
-- =============================================================
entity bs_base_one is
  port (
    bad_val : out integer
  );
end entity bs_base_one;

architecture rtl of bs_base_one is
  constant C_BAD : integer := 1#0#;
begin
  bad_val <= C_BAD;
end architecture rtl;
