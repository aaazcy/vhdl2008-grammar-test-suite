-- =============================================================
-- Case ID: TC_STRING_LITERAL_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_STRING_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 15.7
-- Production: string_literal ::= " { graphic_character } "
-- Case Type: Negative
-- Test Focus: String with a newline character crossing the line boundary — strings cannot contain format control characters and cannot span multiple lines
-- Expected Result: Triggers error
-- Dependencies: None
-- =============================================================
entity str_snn_005 is
  port (
    msg_out : out string(1 to 1)
  );
end entity str_snn_005;

architecture rtl of str_snn_005 is
  constant C_BAD : string(1 to 1) := "
";
begin
  msg_out <= C_BAD;
end architecture rtl;
