-- =============================================================
-- Case ID: TC_TOOL_DIRECTIVE_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_TOOL_DIRECTIVE
-- Standard Reference: IEEE 1076-2008 Section 15.11
-- Production: tool_directive ::= ` identifier { graphic_character }
-- Case Type: Negative
-- Test Focus: Missing backquote prefix — no ` before the identifier, this is not a tool_directive but an ordinary identifier/comment confusion
-- Expected Result: Triggers error
-- Dependencies: None
-- =============================================================
entity td_snn_004 is
  port (
    val_out : out integer
  );
end entity td_snn_004;

architecture rtl of td_snn_004 is
  protect
  signal s_val : integer := 0;
  endprotect
begin
  s_val   <= 5;
  val_out <= s_val;
end architecture rtl;
