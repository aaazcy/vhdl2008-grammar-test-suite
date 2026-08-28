-- =============================================================
-- Case ID: TC_GRAPHIC_CHARACTER_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_GRAPHIC_CHARACTER
-- Standard Reference: IEEE 1076-2008 Section 15.2
-- Production: graphic_character ::= basic_graphic_character | lower_case_letter | other_special_character
-- Case Type: Negative
-- Test Focus: graphic_character: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity graphic_charact_e3 is end entity;
architecture bh of graphic_charact_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;