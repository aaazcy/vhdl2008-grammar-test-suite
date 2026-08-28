-- =============================================================
-- Case ID: TC_BIT_VALUE_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: BNF_BIT_VALUE
-- Standard Reference: IEEE 1076-2008 Section 15.8
-- Production: bit_value ::= graphic_character { [ underline ] graphic_character }
-- Case Type: Negative
-- Test Focus: bit_value digit count mismatching the target bit_vector width(B"101" assigned to a 4-bit vector) — verify semantic analysis detects the bit string literal width inconsistent with the target signal width
-- Expected Result: Triggers semantic error on bit width mismatch
-- Dependencies: None
-- =============================================================
entity bv_width_err is
  port (
    bad_val : out bit_vector(3 downto 0)
  );
end entity bv_width_err;

architecture rtl of bv_width_err is
  constant C_BAD : bit_vector(3 downto 0) := B"101";
begin
  bad_val <= C_BAD;
end architecture rtl;
