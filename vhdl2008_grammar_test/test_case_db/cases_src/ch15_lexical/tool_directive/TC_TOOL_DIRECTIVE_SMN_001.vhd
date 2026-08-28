-- =============================================================
-- Case ID: TC_TOOL_DIRECTIVE_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_TOOL_DIRECTIVE
-- Standard Reference: IEEE 1076-2008 Section 15.11
-- Production: tool_directive ::= ` identifier { graphic_character }
-- Case Type: Negative
-- Test Focus: tool_directive as an unknown directive not understood by tools — unknown directives may be ignored but some tools report semantic warnings or errors
-- Expected Result: Triggers error
-- Dependencies: None
-- =============================================================
entity td_smn_001 is
  port (
    val_out : out integer
  );
end entity td_smn_001;

architecture rtl of td_smn_001 is
  `unknown_unsupported_directive_with_very_long_name_xyz
  signal s_val : integer := 0;
begin
  s_val   <= 15;
  val_out <= s_val;
end architecture rtl;
