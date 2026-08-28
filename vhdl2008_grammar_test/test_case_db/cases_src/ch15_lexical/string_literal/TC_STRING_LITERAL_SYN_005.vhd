-- =============================================================
-- Case ID: TC_STRING_LITERAL_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_STRING_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 15.7
-- Production: string_literal ::= " { graphic_character } "
-- Case Type: Positive
-- Test Focus: Long string containing spaces and punctuation — graphic_character can include space, comma, period etc., test common printable characters in strings
-- Expected Result: Compiles
-- Dependencies: None
-- =============================================================
entity str_long_sentence is
  port (
    msg_out : out string(1 to 19)
  );
end entity str_long_sentence;

architecture rtl of str_long_sentence is
  constant C_INFO : string(1 to 19) := "Hello, VHDL 2008!  ";
begin
  msg_out <= C_INFO;
end architecture rtl;
