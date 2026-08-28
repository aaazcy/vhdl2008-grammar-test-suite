-- =============================================================
-- Case ID: TC_BIT_STRING_LITERAL_SNN_S01
-- Rule Type: Syntax
-- BNF Production: BIT_STRING_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 15.8
-- Test Focus: bit_string_literal: wrong base specifier letter
-- Case Type: Negative (Production-Specific)
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity bsl_e is end entity;
architecture bh of bsl_e is
  constant C_BAD:bit_vector(7 downto 0):=D"FF";  -- ERROR: invalid base specifier D
begin end architecture;
