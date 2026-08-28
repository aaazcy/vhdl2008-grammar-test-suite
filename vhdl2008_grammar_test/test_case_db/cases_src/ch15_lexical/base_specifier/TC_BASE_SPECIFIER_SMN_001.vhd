-- =============================================================
-- Case ID: TC_BASE_SPECIFIER_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_BASE_SPECIFIER
-- Standard Reference: IEEE 1076-2008 Section 15.8
-- Production: base_specifier ::= B | O | X | UB | UO | UX | SB | SO | SX | D
-- Case Type: Negative
-- Test Focus: base_specifier D (decimal) bit string assigned to a width-mismatched port(8 to 4): D"255" produces an 8-bit bit string but the target port is only 4 bits wide, verify semantic analysis detects the bit width mismatch error
-- Expected Result: Triggers semantic error on bit width mismatch
-- Dependencies: None
-- =============================================================
entity bsp_width_mismatch is
  port (
    bad_val : out bit_vector(3 downto 0)
  );
end entity bsp_width_mismatch;

architecture rtl of bsp_width_mismatch is
  constant C_DEC : bit_vector(3 downto 0) := D"255";
begin
  bad_val <= C_DEC;
end architecture rtl;
