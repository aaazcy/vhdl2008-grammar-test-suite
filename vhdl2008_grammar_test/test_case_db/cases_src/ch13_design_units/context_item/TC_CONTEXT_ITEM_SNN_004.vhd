-- =============================================================
-- Case ID: TC_CONTEXT_ITEM_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONTEXT_ITEM
-- Standard Reference: IEEE 1076-2008 Section 13.2
-- Production: context_item ::= library_clause | use_clause | context_reference
-- Case Type: Negative
-- Test Focus: invalid context_item - context_reference missing the "context" keyword: work.my_context; — only a selected_name and a semicolon remain, the required context keyword is missing, so it is not a legal context_reference
-- Expected Result: Triggers syntax error: unexpected identifier, expected keyword "context"
-- Dependencies: None
-- =============================================================
library ieee;
work.my_context;

entity ci_nocontext_kw is
  port (
    y : out bit
  );
end entity ci_nocontext_kw;

architecture rtl of ci_nocontext_kw is
begin
  y <= '0';
end architecture rtl;
