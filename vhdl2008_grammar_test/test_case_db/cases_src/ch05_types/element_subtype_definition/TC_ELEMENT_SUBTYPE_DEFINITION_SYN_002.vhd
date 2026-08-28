-- =============================================================
-- Case ID: TC_ELEMENT_SUBTYPE_DEFINITION_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_ELEMENT_SUBTYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: element_subtype_definition ::= subtype_indication
-- Case Type: Positive
-- Test Focus: element_subtype_definition with bit_vector
--            subtype_indication. A character generator ROM for
--            a text-mode display, each element is a scanline
--            pattern byte.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity char_generator_rom is
  port (
    char_code  : in  integer range 0 to 127;
    scan_line  : in  integer range 0 to 7;
    pixel_row  : out bit_vector(7 downto 0)
  );
end entity char_generator_rom;

architecture rtl of char_generator_rom is
  -- element_subtype_definition: subtype_indication = bit_vector(7 downto 0)
  subtype scanline_t is bit_vector(7 downto 0);
  type char_rom_line is array (0 to 7) of scanline_t;
  type char_rom is array (0 to 127) of char_rom_line;
  -- Simple pattern for character 'A' at code 65
  constant cg_rom : char_rom := (
    65 => (
      0 => "00111000", 1 => "01101100", 2 => "11000110",
      3 => "11000110", 4 => "11111110", 5 => "11000110",
      6 => "11000110", 7 => "00000000"
    ),
    others => (others => (others => '0'))
  );
begin
  pixel_row <= cg_rom(char_code)(scan_line);
end architecture rtl;
