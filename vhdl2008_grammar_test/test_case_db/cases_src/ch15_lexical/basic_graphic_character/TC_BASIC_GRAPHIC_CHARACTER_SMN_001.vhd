-- =============================================================
-- Case ID: TC_BASIC_GRAPHIC_CHARACTER_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_BASIC_GRAPHIC_CHARACTER
-- Standard Reference: IEEE 1076-2008 Section 15.2
-- Production: basic_graphic_character ::= upper_case_letter | digit | special_character | space_character
-- Case Type: Negative
-- Test Focus: space_character of basic_graphic_character appearing as a bare space in the middle of an identifier — identifiers cannot contain space characters, during lexical analysis a space acts as a separator rather than a graphic character identifier component
-- Expected Result: Triggers semantic error on space in identifier
-- Dependencies: None
-- =============================================================
entity bgc_space_in_ident is
  port (
    y : out integer
  );
end entity bgc_space_in_ident;

architecture rtl of bgc_space_in_ident is
  signal sig name : integer := 0;
begin
  y <= 42;
end architecture rtl;
