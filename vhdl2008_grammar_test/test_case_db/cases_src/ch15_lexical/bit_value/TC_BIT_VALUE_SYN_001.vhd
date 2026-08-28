-- =============================================================
-- Case ID: TC_BIT_VALUE_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_BIT_VALUE
-- Standard Reference: IEEE 1076-2008 Section 15.8
-- Production: bit_value ::= graphic_character { [ underline ] graphic_character }
-- Case Type: Positive
-- Test Focus: bit_value minimal form — a single graphic_character(B"0"): verify a single-character bit_value is legal in a bit string literal
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity bv_single_char is
  port (
    v : out bit
  );
end entity bv_single_char;

architecture rtl of bv_single_char is
  constant C_BIT : bit := '0';
begin
  v <= C_BIT;
end architecture rtl;
