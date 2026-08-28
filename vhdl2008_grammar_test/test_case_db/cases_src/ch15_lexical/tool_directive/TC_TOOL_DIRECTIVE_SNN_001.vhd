-- =============================================================
-- Case ID: TC_TOOL_DIRECTIVE_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_TOOL_DIRECTIVE
-- Standard Reference: IEEE 1076-2008 Section 15.11
-- Production: tool_directive ::= ` identifier { graphic_character }
-- Case Type: Negative
-- Test Focus: No identifier after the backquote — an identifier must immediately follow `, a space causes the identifier to be missing, violating the tool_directive syntax
-- Expected Result: Triggers error
-- Dependencies: None
-- =============================================================
entity td_snn_001 is
  port (
    val_out : out integer
  );
end entity td_snn_001;

architecture rtl of td_snn_001 is
  ` 123bad
  signal s_val : integer := 0;
begin
  s_val   <= 5;
  val_out <= s_val;
end architecture rtl;
