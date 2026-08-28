-- =============================================================
-- Case ID: TC_BASIC_GRAPHIC_CHARACTER_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_BASIC_GRAPHIC_CHARACTER
-- Standard Reference: IEEE 1076-2008 Section 15.2
-- Production: basic_graphic_character ::= upper_case_letter | digit | special_character | space_character
-- Case Type: Negative
-- Test Focus: SNN: extended identifier missing the closing backslash — in \bad"quote there is no backslash closing after the double quote, the extended identifier crosses the line-end newline, a format_effector entering the identifier causes a lexical error
-- Expected Result: Triggers syntax error: format effector in extended identifier
-- Dependencies: None
-- =============================================================
entity bgc_unclosed_ext_id is
  port (
    bad_val : out bit_vector(3 downto 0)
  );
end entity bgc_unclosed_ext_id;

architecture vhdl2008 of bgc_unclosed_ext_id is
  signal \bad"quote : bit_vector(3 downto 0);
begin
  bad_val <= \bad"quote;
end architecture vhdl2008;
