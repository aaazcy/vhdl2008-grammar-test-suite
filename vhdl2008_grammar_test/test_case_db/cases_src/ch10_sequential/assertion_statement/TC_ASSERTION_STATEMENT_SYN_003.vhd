-- =============================================================
-- Case ID: TC_ASSERTION_STATEMENT_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_ASSERTION_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.3
-- Production: assertion_statement ::= [ label : ] assert condition [ report expression ] [ severity expression ] ;
-- Case Type: Positive
-- Test Focus: With label: `chk_label : assert condition ;` - verifying assertion_statement may have an optional label prefix
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity assert_stmt_label_ent is
  port (addr : in integer range 0 to 255; ready : out boolean);
end entity assert_stmt_label_ent;

architecture checked of assert_stmt_label_ent is
begin
  process(addr) is
  begin
    addr_check: assert addr < 256;
    ready <= true;
  end process;
end architecture checked;
