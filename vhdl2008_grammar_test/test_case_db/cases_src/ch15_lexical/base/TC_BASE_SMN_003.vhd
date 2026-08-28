-- =============================================================
-- Case ID: TC_BASE_SMN_003
-- Rule Type: Semantic
-- Related Rule ID: BNF_BASE
-- Standard Reference: IEEE 1076-2008 Section 15.5.3
-- Production: base ::= integer
-- Case Type: Negative
-- Test Focus: base integer beyond the VHDL integer literal range (containing the extreme value 99999999999999999999): verify semantic/lexical analysis detects literal overflow while scanning the base integer
-- Expected Result: Triggers semantic error on base integer overflow
-- Dependencies: None
-- =============================================================
entity bs_base_overflow is
  port (
    bad_val : out integer
  );
end entity bs_base_overflow;

architecture rtl of bs_base_overflow is
  constant C_BAD : integer := 99999999999999999999#FF#;
begin
  bad_val <= C_BAD;
end architecture rtl;
