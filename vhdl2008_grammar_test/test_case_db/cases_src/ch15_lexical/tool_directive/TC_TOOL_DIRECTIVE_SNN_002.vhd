-- =============================================================
-- Case ID: TC_TOOL_DIRECTIVE_SNN_002
-- Rule Type: Syntax
-- BNF Production: TOOL_DIRECTIVE
-- IEEE Section: 15.11
-- BNF Text: tool_directive ::= ` identifier { graphic_character }
-- Test Focus: Invalid tool directive — backtick not followed by an identifier (malformed token)
-- Case Type: Negative
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
`123invalid
entity tool_directive_snn_002 is
  port (
    data_out : out bit_vector(7 downto 0)
  );
end entity tool_directive_snn_002;

architecture bh of tool_directive_snn_002 is
  constant C_VAL : bit_vector(7 downto 0) := X"FF";
begin
  data_out <= C_VAL;
end architecture bh;
