-- =============================================================
-- Case ID: TC_BASIC_GRAPHIC_CHARACTER_SMN_003
-- Rule Type: Semantic
-- Related Rule ID: BNF_BASIC_GRAPHIC_CHARACTER
-- Standard Reference: IEEE 1076-2008 Section 15.2
-- Production: basic_graphic_character ::= upper_case_letter | digit | special_character | space_character
-- Case Type: Negative
-- Test Focus: special character '#' of basic_graphic_character used as the first character of an identifier — identifiers must start with a letter, '#' is a special_character and cannot be part of an identifier; verify semantic/lexical analysis rejects it
-- Expected Result: Triggers semantic error on special char as identifier
-- Dependencies: None
-- =============================================================
entity bgc_hash_as_ident is
  port (
    y : out integer
  );
end entity bgc_hash_as_ident;

architecture rtl of bgc_hash_as_ident is
  signal #foo : integer := 0;
begin
  y <= #foo;
end architecture rtl;
