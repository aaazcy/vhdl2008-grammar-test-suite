-- =============================================================
-- Case ID: TC_CONTEXT_REFERENCE_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONTEXT_REFERENCE
-- Standard Reference: IEEE 1076-2008 Section 13.2
-- Production: context_reference ::= context selected_name { , selected_name } ;
-- Case Type: Negative
-- Test Focus: context_reference missing the "context" keyword: work.my_ctx; — only a selected_name and a semicolon remain, the required context keyword is missing, and the parser treats it as an illegal standalone identifier statement
-- Expected Result: Triggers syntax error: unexpected identifier "work", expected keyword "context" or context_item
-- Dependencies: None
-- =============================================================
library ieee;
work.type_ctx;

entity cr_no_context_kw is
  port (
    y : out bit
  );
end entity cr_no_context_kw;

architecture rtl of cr_no_context_kw is
begin
  y <= '0';
end architecture rtl;
