-- =============================================================
-- Case ID: TC_EXTENDED_IDENTIFIER_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXTENDED_IDENTIFIER
-- Standard Reference: IEEE 1076-2008 Section 15.4.2
-- Production: extended_identifier ::= \ graphic_character { graphic_character } \
-- Case Type: Positive
-- Test Focus: extended_identifier containing spaces and several special symbols, verifying space is legal as graphic_character inside \...\
-- Expected Result: Compiles
-- Dependencies: None
-- =============================================================
entity ext_id_spaces is
  port (
    \bus address\ : out integer;
    \chip select\ : out bit
  );
end entity ext_id_spaces;

architecture rtl of ext_id_spaces is
  constant \max value\ : integer := 255;
  signal \addr reg\   : integer range 0 to 255 := 0;
begin
  \addr reg\     <= \max value\;
  \bus address\  <= \addr reg\;
  \chip select\  <= '1';
end architecture rtl;
