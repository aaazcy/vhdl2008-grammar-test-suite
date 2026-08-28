-- =============================================================
-- Case ID: TC_EXTENDED_IDENTIFIER_SNN_002
-- Rule Type: Syntax
-- BNF Production: EXTENDED_IDENTIFIER
-- IEEE Section: 15.4.2
-- BNF Text: extended_identifier ::= \ graphic_character { graphic_character } \
-- Test Focus: Extended identifier without closing backslash — must be delimited by \ on both sides
-- Case Type: Negative
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity extended_identifier_snn_002 is
  port (
    data_in  : in  bit_vector(7 downto 0);
    data_out : out bit_vector(7 downto 0)
  );
end entity extended_identifier_snn_002;

architecture rtl of extended_identifier_snn_002 is
  -- ERROR: extended_identifier opened with \ but not closed — missing closing backslash
  signal \unclosed_signal : bit_vector(7 downto 0);
begin
  data_out <= data_in;
end architecture rtl;
