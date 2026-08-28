-- =============================================================
-- Case ID: TC_TOOL_DIRECTIVE_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_TOOL_DIRECTIVE
-- Standard Reference: IEEE 1076-2008 Section 15.11
-- Production: tool_directive ::= ` identifier { graphic_character }
-- Case Type: Positive
-- Test Focus: tool_directive with {graphic_character} additional data — `pragma followed by multiple graphic_characters forming a compilation directive argument string
-- Expected Result: Compiles
-- Dependencies: None
-- =============================================================
entity td_with_args is
  port (
    val_out : out integer
  );
end entity td_with_args;

architecture rtl of td_with_args is
  `protect data_method = "aes256"
  signal s_val : integer := 0;
  `protect encoding = "base64"
begin
  s_val   <= 77;
  val_out <= s_val;
end architecture rtl;
