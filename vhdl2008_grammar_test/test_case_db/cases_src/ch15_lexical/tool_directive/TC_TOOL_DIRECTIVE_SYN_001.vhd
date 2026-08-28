-- =============================================================
-- Case ID: TC_TOOL_DIRECTIVE_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_TOOL_DIRECTIVE
-- Standard Reference: IEEE 1076-2008 Section 15.11
-- Production: tool_directive ::= ` identifier { graphic_character }
-- Case Type: Positive
-- Test Focus: Minimal tool_directive with only backquote and identifier — `protect without additional graphic_characters, verify the minimal form
-- Expected Result: Compiles
-- Dependencies: None
-- =============================================================
entity td_simple is
  port (
    val_out : out integer
  );
end entity td_simple;

architecture rtl of td_simple is
  `protect begin
  signal s_data : integer := 42;
  `protect end
begin
  s_data  <= 100;
  val_out <= s_data;
end architecture rtl;
