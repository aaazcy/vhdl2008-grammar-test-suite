-- =============================================================
-- Case ID: TC_EXTENDED_IDENTIFIER_SYN_S01
-- Rule Type: Syntax
-- BNF Production: EXTENDED_IDENTIFIER
-- IEEE Section: 15.4.2
-- BNF Text: extended_identifier ::= \ graphic_character { graphic_character } \
-- Test Focus: Extended identifier used as entity and signal names with spaces and special characters
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity extended_identifier_syn_s01 is
  port (
    input_port  : in  bit_vector(3 downto 0);
    output_port : out bit_vector(3 downto 0)
  );
end entity extended_identifier_syn_s01;

architecture rtl of extended_identifier_syn_s01 is
  -- Extended identifier containing spaces
  signal \my register bank\ : bit_vector(3 downto 0);
  -- Extended identifier with special characters
  alias \data+path\ is \my register bank\;
begin
  \my register bank\ <= input_port;
  output_port <= \my register bank\;
end architecture rtl;
