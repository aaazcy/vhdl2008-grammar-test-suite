-- =============================================================
-- Case ID: TC_TOOL_DIRECTIVE_SYN_002
-- Rule Type: Syntax
-- BNF Production: TOOL_DIRECTIVE
-- IEEE Section: 15.11
-- BNF Text: tool_directive ::= ` identifier { graphic_character }
-- Test Focus: Tool directives with arguments (graphic characters following the identifier)
-- Case Type: Positive
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
`protect data_method = "aes256"
entity tool_directive_syn_002 is
  port (
    data_out : out bit_vector(15 downto 0)
  );
end entity tool_directive_syn_002;

architecture bh of tool_directive_syn_002 is
  constant C_PATTERN : bit_vector(15 downto 0) := X"CAFE";
begin
  data_out <= C_PATTERN;
end architecture bh;
`protect end
