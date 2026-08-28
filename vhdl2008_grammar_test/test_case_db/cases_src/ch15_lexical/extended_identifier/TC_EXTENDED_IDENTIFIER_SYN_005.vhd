-- =============================================================
-- Case ID: TC_EXTENDED_IDENTIFIER_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXTENDED_IDENTIFIER
-- Standard Reference: IEEE 1076-2008 Section 15.4.2
-- Production: extended_identifier ::= \ graphic_character { graphic_character } \
-- Case Type: Positive
-- Test Focus: extended_identifier starting with a digit — inside \...\ the first character may be a digit, breaking the basic_identifier restriction
-- Expected Result: Compiles
-- Dependencies: None
-- =============================================================
entity ext_id_digit_start is
  port (
    \0base\   : out integer;
    \1st_bit\ : out bit;
    \2nd_bit\ : out bit
  );
end entity ext_id_digit_start;

architecture rtl of ext_id_digit_start is
  signal \3wire_bus\ : integer := 0;
begin
  \3wire_bus\ <= 7;
  \0base\     <= \3wire_bus\;
  \1st_bit\   <= '1';
  \2nd_bit\   <= '0';
end architecture rtl;
