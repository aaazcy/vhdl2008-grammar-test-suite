-- =============================================================
-- Case ID: TC_CONTEXT_ITEM_SYN_S01
-- Rule Type: Syntax
-- BNF Production: context_item
-- IEEE Section: 13.2
-- BNF Text: context_item ::= library_clause | use_clause | context_reference
-- Test Focus: library_clause as a context_item — library declaration in context clause
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;

entity tc_context_item_syn_s01 is
  port (
    a : in  bit;
    y : out bit
  );
end entity tc_context_item_syn_s01;

architecture rtl of tc_context_item_syn_s01 is
begin
  y <= a;
end architecture rtl;
