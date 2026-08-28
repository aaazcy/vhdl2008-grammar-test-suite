-- =============================================================
-- Case ID: TC_GRAPHIC_CHARACTER_SNN_002
-- Rule Type: Syntax
-- BNF Production: GRAPHIC_CHARACTER
-- IEEE Section: 15.2
-- BNF Text: graphic_character ::= basic_graphic_character | lower_case_letter | other_special_character
-- Test Focus: SNN: Extended identifier missing closing backslash — in signal \bad"quote the backslash has no paired close, the extended identifier runs past end of line, the newline format_effector is not a graphic_character and cannot appear inside an extended identifier
-- Case Type: Negative
-- Expected Result: Triggers syntax error: format effector in extended identifier
-- Dependencies: None
-- =============================================================
entity graphic_character_snn_002 is
  port (
    data_in  : in  bit_vector(3 downto 0);
    data_out : out bit_vector(3 downto 0)
  );
end entity graphic_character_snn_002;

architecture vhdl2008 of graphic_character_snn_002 is
  signal \bad"quote : bit_vector(3 downto 0);
begin
  data_out <= data_in;
end architecture vhdl2008;
