-- =============================================================
-- Case ID: TC_CONTEXT_ITEM_SNN_002
-- Rule Type: Syntax
-- BNF Production: context_item
-- IEEE Section: 13.2
-- BNF Text: context_item ::= library_clause | use_clause | context_reference
-- Test Focus: Invalid context_item — bare identifier is not a valid context_item form
-- Case Type: Negative
-- Expected Result: Triggers syntax error: bare identifier not recognized as context_item
-- Dependencies: None
-- =============================================================
ieee;  -- ERROR: bare identifier not a valid context_item (missing 'library' keyword)

entity tc_context_item_snn_002 is
  port (
    a : in  bit;
    y : out bit
  );
end entity tc_context_item_snn_002;

architecture rtl of tc_context_item_snn_002 is
begin
  y <= a;
end architecture rtl;
