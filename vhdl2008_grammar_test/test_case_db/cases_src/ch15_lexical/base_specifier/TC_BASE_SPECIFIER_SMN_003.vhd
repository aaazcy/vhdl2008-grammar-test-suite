-- =============================================================
-- Case ID: TC_BASE_SPECIFIER_SMN_003
-- Rule Type: Semantic
-- Related Rule ID: BNF_BASE_SPECIFIER
-- Standard Reference: IEEE 1076-2008 Section 15.8
-- Production: base_specifier ::= B | O | X | UB | UO | UX | SB | SO | SX | D
-- Case Type: Negative
-- Test Focus: base_specifier UB (unsigned binary) bit string assigned to a signed type signal — UB implies unsigned semantics but the target type is signed, verify the type compatibility semantic check
-- Expected Result: Triggers semantic warning/error on signed/unsigned mismatch
-- Dependencies: None
-- =============================================================
entity bsp_unsigned_to_signed is
  port (
    bad_val : out integer
  );
end entity bsp_unsigned_to_signed;

architecture rtl of bsp_unsigned_to_signed is
  constant C_UB : bit_vector(7 downto 0) := UB"11111111";
  signal s_signed : integer range -128 to 127;
begin
  s_signed <= C_UB;
  bad_val <= s_signed;
end architecture rtl;
