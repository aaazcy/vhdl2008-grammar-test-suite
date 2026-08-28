-- =============================================================
-- Case ID: TC_BASIC_GRAPHIC_CHARACTER_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_BASIC_GRAPHIC_CHARACTER
-- Standard Reference: IEEE 1076-2008 Section 15.2
-- Production: basic_graphic_character ::= upper_case_letter | digit | special_character| space_character
-- Case Type: Negative
-- Test Focus: basic_graphic_character: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity basic_graphic_c_e3 is end entity;
architecture bh of basic_graphic_c_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;