-- =============================================================
-- Case ID: TC_STRING_LITERAL_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_STRING_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 15.7
-- Production: string_literal ::= " { graphic_character } "
-- Case Type: Negative
-- Test Focus: String missing the closing double quote — string_literal must be enclosed in a pair of double quotes, the missing closing quote causes a lexical error
-- Expected Result: Triggers error
-- Dependencies: None
-- =============================================================
entity str_snn_001 is
  port (
    msg_out : out string(1 to 4)
  );
end entity str_snn_001;

architecture rtl of str_snn_001 is
  constant C_BAD : string(1 to 4) := "ABCD;
begin
  msg_out <= C_BAD;
end architecture rtl;
