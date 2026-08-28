-- =============================================================
-- Case ID: TC_STRING_LITERAL_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: BNF_STRING_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 15.7
-- Production: string_literal ::= " { graphic_character } "
-- Case Type: Negative
-- Test Focus: SMN: unterminated string literal — in "ab there is only the opening double quote, string_literal must be closed by a pair of double quotes, string literals cannot span lines
-- Expected Result: Triggers analysis error: string cannot be multi-line, use concatenation
-- Dependencies: None
-- =============================================================
entity str_unterminated is
  port (
    val_out : out string(1 to 2)
  );
end entity str_unterminated;

architecture vhdl2008 of str_unterminated is
  constant C_BAD : string(1 to 2) := "ab;
begin
  val_out <= C_BAD;
end architecture vhdl2008;
