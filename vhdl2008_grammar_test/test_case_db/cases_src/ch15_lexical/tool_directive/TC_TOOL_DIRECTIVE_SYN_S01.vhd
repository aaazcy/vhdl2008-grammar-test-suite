-- =============================================================
-- Case ID: TC_TOOL_DIRECTIVE_SYN_S01
-- Rule Type: Syntax
-- BNF Production: TOOL_DIRECTIVE
-- IEEE Section: 15.11
-- BNF Text: tool_directive ::= ` identifier { graphic_character }
-- Test Focus: Basic tool directive with a simple identifier — demonstrating the backtick-prefixed syntax
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
`protect begin
entity tool_directive_syn_s01 is
  port (
    data_out : out bit_vector(7 downto 0)
  );
end entity tool_directive_syn_s01;

architecture bh of tool_directive_syn_s01 is
  constant C_VALUE : bit_vector(7 downto 0) := X"5A";
begin
  data_out <= C_VALUE;
end architecture bh;
`protect end
