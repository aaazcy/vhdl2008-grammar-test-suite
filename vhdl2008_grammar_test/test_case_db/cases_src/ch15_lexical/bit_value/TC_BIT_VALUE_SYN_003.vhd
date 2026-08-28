-- =============================================================
-- Case ID: TC_BIT_VALUE_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_BIT_VALUE
-- Standard Reference: IEEE 1076-2008 Section 15.8
-- Production: bit_value ::= graphic_character { [ underline ] graphic_character }
-- Case Type: Positive
-- Test Focus: bit_value with underscore-grouped bit string(X"DE_AD_BE_EF") — verify underscores as separators in a graphic_character sequence are legal across multiple groups of hexadecimal bit values
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity bv_underscore_groups is
  port (
    v : out bit_vector(31 downto 0)
  );
end entity bv_underscore_groups;

architecture rtl of bv_underscore_groups is
  constant C_HEX : bit_vector(31 downto 0) := X"DE_AD_BE_EF";
begin
  v <= C_HEX;
end architecture rtl;
