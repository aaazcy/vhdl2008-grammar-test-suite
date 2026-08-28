-- =============================================================
-- Case ID: TC_TOOL_DIRECTIVE_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_TOOL_DIRECTIVE
-- Standard Reference: IEEE 1076-2008 Section 15.11
-- Production: tool_directive ::= ` identifier { graphic_character }
-- Case Type: Positive
-- Test Focus: Multiple different tool_directives used in succession — standard encryption directives such as `protect, `author, `key in the same file
-- Expected Result: Compiles
-- Dependencies: None
-- =============================================================
entity td_multi_directives is
  port (
    ip_out : out integer
  );
end entity td_multi_directives;

architecture rtl of td_multi_directives is
  `protect begin
  `protect author_info = "VHDL Test Suite"
  `protect encrypt_agent = "Acme Corp"
  `protect key_block = "RSAPrivateKey"
  signal s_ip : integer := 999;
  `protect end
begin
  s_ip   <= 888;
  ip_out <= s_ip;
end architecture rtl;
