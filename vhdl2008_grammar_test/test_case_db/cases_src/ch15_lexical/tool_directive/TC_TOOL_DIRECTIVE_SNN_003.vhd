-- =============================================================
-- Case ID: TC_TOOL_DIRECTIVE_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_TOOL_DIRECTIVE
-- Standard Reference: IEEE 1076-2008 Section 15.11
-- Production: tool_directive ::= ` identifier { graphic_character }
-- Case Type: Negative
-- Test Focus: tool_directive: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity tool_directive_e3 is end entity;
architecture bh of tool_directive_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;