-- =============================================================
-- Case ID: TC_BIT_STRING_LITERAL_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_BIT_STRING_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 15.8
-- Production: bit_string_literal ::= [ integer ] base_specifier " [ bit_value ] "
-- Case Type: Negative
-- Test Focus: bit_string_literal: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity bit_string_lite_e2 is end entity;
architecture bh of bit_string_lite_e2 is
  -- ERROR: invalid syntax in bit_string_literal
  signal s : bit;
begin
  s <= '1'
end architecture bh;