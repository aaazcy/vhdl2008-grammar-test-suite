-- =============================================================
-- Case ID: TC_TOOL_DIRECTIVE_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_TOOL_DIRECTIVE
-- Standard Reference: IEEE 1076-2008 Section 15.11
-- Production: tool_directive ::= ` identifier { graphic_character }
-- Case Type: Positive
-- Test Focus: Custom tool_directive — using the non-standard but legal `custom_directive, verify the combination of arbitrary identifier and graphic_character
-- Expected Result: Compiles
-- Dependencies: None
-- =============================================================
entity td_custom is
  port (
    val_out : out integer
  );
end entity td_custom;

architecture rtl of td_custom is
  `timescale 1 ns / 10 ps
  signal s_data : integer := 15;
  `resetall
begin
  s_data  <= 30;
  val_out <= s_data;
end architecture rtl;
