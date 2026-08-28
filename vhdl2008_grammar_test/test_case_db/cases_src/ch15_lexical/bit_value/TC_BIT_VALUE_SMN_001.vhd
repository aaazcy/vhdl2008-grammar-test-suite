-- =============================================================
-- Case ID: TC_BIT_VALUE_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_BIT_VALUE
-- Standard Reference: IEEE 1076-2008 Section 15.8
-- Production: bit_value ::= graphic_character { [ underline ] graphic_character }
-- Case Type: Negative
-- Test Focus: bit_value appearing alone in a non-bit-string context — a bare binary digit sequence "1010" appears in an expression outside bit string delimiters; verify semantic analysis rejects an isolated bit_value as an expression
-- Expected Result: Triggers semantic error on bare bit_value in expression
-- Dependencies: None
-- =============================================================
entity bv_bare_value is
  port (
    bad_val : out integer
  );
end entity bv_bare_value;

architecture rtl of bv_bare_value is
begin
  bad_val <= B"1010";
end architecture rtl;
