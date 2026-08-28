-- =============================================================
-- Case ID: TC_TOOL_DIRECTIVE_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_TOOL_DIRECTIVE
-- Standard Reference: IEEE 1076-2008 Section 15.11
-- Production: tool_directive ::= ` identifier { graphic_character }
-- Case Type: Negative
-- Test Focus: Identifier starting with a digit after the backquote — identifiers must start with a letter, a digit-leading token after ` is not a legal identifier
-- Expected Result: Triggers error
-- Dependencies: None
-- =============================================================
entity td_snn_005 is
  port (
    val_out : out integer
  );
end entity td_snn_005;

architecture rtl of td_snn_005 is
  `1bad_directive
  signal s_val : integer := 0;
begin
  s_val   <= 5;
  val_out <= s_val;
end architecture rtl;
