-- =============================================================
-- Case ID: TC_EXTENDED_DIGIT_SYN_002
-- Rule Type: Syntax
-- BNF Production: EXTENDED_DIGIT
-- IEEE Section: 15.5.3
-- BNF Text: extended_digit ::= digit | letter
-- Test Focus: Extended digits using letters A-F (letter subclass) in hex based literals
-- Case Type: Positive
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity extended_digit_syn_002 is
  port (
    hex_val : out bit_vector(23 downto 0)
  );
end entity extended_digit_syn_002;

architecture bh of extended_digit_syn_002 is
  -- Extended digits A through F in hex based literals
  constant C_COLOR_WHITE : bit_vector(23 downto 0) := X"FFFFFF";
  constant C_COLOR_BLACK : bit_vector(23 downto 0) := X"000000";
  constant C_COLOR_RED   : bit_vector(23 downto 0) := X"FF0000";
  signal s_pixel          : bit_vector(23 downto 0);
begin
  s_pixel <= C_COLOR_WHITE xor C_COLOR_RED;
  hex_val <= s_pixel;
end architecture bh;
