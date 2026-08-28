-- =============================================================
-- Case ID: TC_STRING_LITERAL_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_STRING_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 15.7
-- Production: string_literal ::= " { graphic_character } "
-- Case Type: Negative
-- Test Focus: A single unescaped double quote in a string — a single " in a string is interpreted as the string terminator, causing a syntax error
-- Expected Result: Triggers error
-- Dependencies: None
-- =============================================================
entity str_snn_004 is
  port (
    msg_out : out string(1 to 5)
  );
end entity str_snn_004;

architecture rtl of str_snn_004 is
  constant C_BAD : string(1 to 5) := "AB"CD";
begin
  msg_out <= C_BAD;
end architecture rtl;
