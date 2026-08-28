-- =============================================================
-- Case ID: TC_BIT_STRING_LITERAL_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_BIT_STRING_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 15.8
-- Production: bit_string_literal ::= [ integer ] base_specifier " [ bit_value ] "
-- Case Type: Negative
-- Test Focus: bit_string_literal: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity bit_string_lite_e3 is end entity;
architecture bh of bit_string_lite_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;