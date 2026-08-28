-- =============================================================
-- Case ID: TC_CONTEXT_ITEM_SYN_002
-- Rule Type: Syntax
-- BNF Production: context_item
-- IEEE Section: 13.2
-- BNF Text: context_item ::= library_clause | use_clause | context_reference
-- Test Focus: use_clause as a context_item — use declaration in context clause
-- Case Type: Positive
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity tc_context_item_syn_002 is
  port (
    d : in  std_logic;
    q : out std_logic
  );
end entity tc_context_item_syn_002;

architecture rtl of tc_context_item_syn_002 is
begin
  q <= d;
end architecture rtl;
