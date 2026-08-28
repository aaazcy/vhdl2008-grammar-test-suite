-- =============================================================
-- Case ID: TC_TOOL_DIRECTIVE_SMN_3
-- Rule Type: Semantic
-- Related Rule ID: BNF_TOOL_DIRECTIVE
-- Standard Reference: IEEE 1076-2008 Section 15.11
-- Production: tool_directive ::= ` identifier { graphic_character }
-- Case Type: Negative
-- Test Focus: `endprotect without a matching `protect — the pairing semantics of tool_directive require protect/endprotect to appear in pairs
-- Expected Result: Triggers error
-- Dependencies: None
-- =============================================================
entity td_sem_002 is
  port (
    val_out : out integer
  );
end entity td_sem_002;

architecture rtl of td_sem_002 is
  signal s_data : integer := 10;
  `endprotect
begin
  s_data  <= 20;
  val_out <= s_data;
end architecture rtl;
