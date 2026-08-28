-- =============================================================
-- Case ID: TC_CONTEXT_REFERENCE_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONTEXT_REFERENCE
-- Standard Reference: IEEE 1076-2008 Section 13.2
-- Production: context_reference ::= context selected_name { , selected_name } ;
-- Case Type: Negative
-- Test Focus: context_reference missing semicolon: context work.my_ctx (no ;) — context_reference must have a semicolon terminator; the missing semicolon prevents the parser from recognizing the statement boundary
-- Expected Result: Triggers syntax error: missing ";" after context_reference
-- Dependencies: None
-- =============================================================
library ieee;
context work.type_pkg_ctx

entity cr_no_semi is
  port (
    y : out bit
  );
end entity cr_no_semi;

architecture rtl of cr_no_semi is
begin
  y <= '0';
end architecture rtl;
