-- =============================================================
-- Case ID: TC_EXTENDED_IDENTIFIER_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXTENDED_IDENTIFIER
-- Standard Reference: IEEE 1076-2008 Section 15.4.2
-- Production: extended_identifier ::= \ graphic_character { graphic_character } \
-- Case Type: Negative
-- Test Focus: SNN: Extended identifier missing closing backslash — \bad has only the opening backslash, the extended identifier runs past end of line, the newline format_effector cannot appear inside an extended identifier
-- Expected Result: Triggers syntax error: format effector in extended identifier
-- Dependencies: None
-- =============================================================
entity ext_id_unterminated is
  port (
    val_out : out integer
  );
end entity ext_id_unterminated;

architecture vhdl2008 of ext_id_unterminated is
  signal \bad : integer;
begin
  val_out <= 0;
end architecture vhdl2008;
