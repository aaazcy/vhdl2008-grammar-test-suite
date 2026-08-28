-- =============================================================
-- Case ID: TC_BASIC_CHARACTER_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_BASIC_CHARACTER
-- Standard Reference: IEEE 1076-2008 Section 15.2
-- Production: basic_character ::= basic_graphic_character | format_effector
-- Case Type: Positive
-- Test Focus: digit characters '0'..'9' of basic_character used as character literals in string aggregates — verify the digit class of graphic characters is legal in string construction
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity bc_digit_chars is
  port (
    seg : out bit_vector(6 downto 0)
  );
end entity bc_digit_chars;

architecture rtl of bc_digit_chars is
  constant C_DIGITS : string(1 to 3) := "123";
  signal s_seg : bit_vector(6 downto 0) := "0000000";
begin
  s_seg <= "1111110" when C_DIGITS(1) = '1' else "0000000";
  seg <= s_seg;
end architecture rtl;
