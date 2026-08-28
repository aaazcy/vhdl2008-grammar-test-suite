-- =============================================================
-- Case ID: TC_TOOL_DIRECTIVE_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: BNF_TOOL_DIRECTIVE
-- Standard Reference: IEEE 1076-2008 Section 15.11
-- Production: tool_directive ::= ` identifier { graphic_character }
-- Case Type: Negative
-- Test Focus: tool_directive used in a package declaration — the `protect encryption tool directive is only valid in certain contexts, in a package declaration it may be semantically non-conforming
-- Expected Result: Triggers error
-- Dependencies: None
-- =============================================================
entity td_smn_002 is
  port (
    val_out : out integer
  );
end entity td_smn_002;

architecture rtl of td_smn_002 is
  signal s_val : integer := 25;
  `protect begin_protected
  `endprotect begin_protected
begin
  s_val   <= 50;
  val_out <= s_val;
end architecture rtl;
