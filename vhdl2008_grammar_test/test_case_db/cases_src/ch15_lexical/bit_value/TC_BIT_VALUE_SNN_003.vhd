-- =============================================================
-- Case ID: TC_BIT_VALUE_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_BIT_VALUE
-- Standard Reference: IEEE 1076-2008 Section 15.8
-- Production: bit_value ::= graphic_character { [ underline ] graphic_character }
-- Case Type: Negative
-- Test Focus: bit_value: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity bit_value_e3 is end entity;
architecture bh of bit_value_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;