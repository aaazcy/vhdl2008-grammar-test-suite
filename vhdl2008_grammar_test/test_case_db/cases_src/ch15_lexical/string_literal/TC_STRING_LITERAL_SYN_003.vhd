-- =============================================================
-- Case ID: TC_STRING_LITERAL_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_STRING_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 15.7
-- Production: string_literal ::= " { graphic_character } "
-- Case Type: Positive
-- Test Focus: Empty string (no characters between the two double quotes) — verify zero repetitions of {graphic_character}, the empty string is a legal string_literal in VHDL
-- Expected Result: Compiles
-- Dependencies: None
-- =============================================================
entity str_empty is
  port (
    msg_out : out string(1 to 1)
  );
end entity str_empty;

architecture rtl of str_empty is
  constant C_EMPTY : string(1 to 0) := "";
  signal s_char    : character := 'X';
begin
  s_char  <= 'A';
  msg_out <= (others => s_char);
end architecture rtl;
