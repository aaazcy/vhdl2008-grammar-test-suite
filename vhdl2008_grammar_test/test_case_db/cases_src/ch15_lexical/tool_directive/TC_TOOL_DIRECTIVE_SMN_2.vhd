-- =============================================================
-- Case ID: TC_TOOL_DIRECTIVE_SMN_2
-- Rule Type: Semantic
-- Related Rule ID: BNF_TOOL_DIRECTIVE
-- Standard Reference: IEEE 1076-2008 Section 15.11
-- Production: tool_directive ::= ` identifier { graphic_character }
-- Case Type: Negative
-- Test Focus: `protect interrupting in the middle of signal declarations — tool_directive placed in a non-declarative region position causes a semantic structure error
-- Expected Result: Triggers error
-- Dependencies: None
-- =============================================================
entity td_sem_001 is
  port (
    val_out : out integer
  );
end entity td_sem_001;

architecture rtl of td_sem_001 is
  signal s_a : integer := 1;
begin
  `protect
  s_a <= 5;
  val_out <= s_a;
end architecture rtl;
