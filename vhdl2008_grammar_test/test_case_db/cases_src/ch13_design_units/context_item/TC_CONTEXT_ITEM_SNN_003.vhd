-- =============================================================
-- Case ID: TC_CONTEXT_ITEM_SNN_003
-- Rule Type: Syntax
-- BNF Production: context_item
-- IEEE Section: 13.2
-- BNF Text: context_item ::= library_clause | use_clause | context_reference
-- Test Focus: Invalid context_item — 'import' keyword is not a valid context_item form
-- Case Type: Negative
-- Expected Result: Triggers syntax error: 'import' is not library/use/context
-- Dependencies: None
-- =============================================================
import ieee.std_logic_1164.all;  -- ERROR: 'import' is not a valid context_item keyword

entity tc_context_item_snn_003 is
  port (
    a : in  bit;
    y : out bit
  );
end entity tc_context_item_snn_003;

architecture rtl of tc_context_item_snn_003 is
begin
  y <= a;
end architecture rtl;
