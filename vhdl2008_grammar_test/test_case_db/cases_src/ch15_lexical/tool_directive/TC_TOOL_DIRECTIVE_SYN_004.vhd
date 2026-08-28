-- =============================================================
-- Case ID: TC_TOOL_DIRECTIVE_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_TOOL_DIRECTIVE
-- Standard Reference: IEEE 1076-2008 Section 15.11
-- Production: tool_directive ::= ` identifier { graphic_character }
-- Case Type: Positive
-- Test Focus: tool_directive used to protect encrypted IP blocks — multiple tool_directives combined to form a protect/endprotect region
-- Expected Result: Compiles
-- Dependencies: None
-- =============================================================
entity td_protect_block is
  port (
    secure_out : out integer
  );
end entity td_protect_block;

architecture rtl of td_protect_block is
  `protect data_method = "aes256"
  signal s_key : integer := 12345;
  `protect end
begin
  s_key      <= 54321;
  secure_out <= s_key;
end architecture rtl;
