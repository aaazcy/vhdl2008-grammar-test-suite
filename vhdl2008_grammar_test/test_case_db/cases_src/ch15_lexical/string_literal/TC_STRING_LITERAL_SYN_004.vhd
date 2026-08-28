-- =============================================================
-- Case ID: TC_STRING_LITERAL_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_STRING_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 15.7
-- Production: string_literal ::= " { graphic_character } "
-- Case Type: Positive
-- Test Focus: String containing escaped double quotes — two consecutive double quotes in a string denote one literal double quote character, test the boundary case of graphic_character
-- Expected Result: Compiles
-- Dependencies: None
-- =============================================================
entity str_escaped_quote is
  port (
    msg_out : out string(1 to 7)
  );
end entity str_escaped_quote;

architecture rtl of str_escaped_quote is
  constant C_MSG : string(1 to 7) := "A""B""C""D";
begin
  msg_out <= C_MSG;
end architecture rtl;
