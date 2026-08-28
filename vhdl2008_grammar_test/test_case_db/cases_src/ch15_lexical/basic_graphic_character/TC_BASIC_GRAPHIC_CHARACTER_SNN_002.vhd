-- =============================================================
-- Case ID: TC_BASIC_GRAPHIC_CHARACTER_SNN_002
-- Rule Type: Syntax
-- BNF Production: BASIC_GRAPHIC_CHARACTER
-- IEEE Section: 15.2
-- BNF Text: basic_graphic_character ::= upper_case_letter | digit | special_character | space_character
-- Test Focus: SNN: newline format_effector inside an extended identifier — in signal \unterminated a newline is mixed between the backslashes, format_effector is not a basic_graphic_character and cannot appear inside an extended identifier
-- Case Type: Negative
-- Expected Result: Triggers syntax error: format effector in extended identifier
-- Dependencies: None
-- =============================================================
entity basic_graphic_charac_snn_002 is
  port (
    flag_out : out integer
  );
end entity basic_graphic_charac_snn_002;

architecture vhdl2008 of basic_graphic_charac_snn_002 is
  signal \unterminated : integer;
begin
  flag_out <= 0;
end architecture vhdl2008;
