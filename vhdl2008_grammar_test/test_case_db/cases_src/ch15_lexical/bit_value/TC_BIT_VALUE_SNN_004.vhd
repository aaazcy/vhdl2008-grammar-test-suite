-- =============================================================
-- Case ID: TC_BIT_VALUE_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_BIT_VALUE
-- Standard Reference: IEEE 1076-2008 Section 15.8
-- Production: bit_value ::= graphic_character { [ underline ] graphic_character }
-- Case Type: Negative
-- Test Focus: space inside bit_value(B"10 10") — the graphic_character sequence cannot contain spaces; verify lexical analysis treats the space as a bit_string terminator causing a subsequent syntax error
-- Expected Result: Triggers syntax error on space in bit value
-- Dependencies: None
-- =============================================================
entity bv_space_inside is
  port (
    bad_val : out bit_vector(3 downto 0)
  );
end entity bv_space_inside;

architecture rtl of bv_space_inside is
  constant C_BAD : bit_vector(3 downto 0) := B"10 10";
begin
  bad_val <= C_BAD;
end architecture rtl;
