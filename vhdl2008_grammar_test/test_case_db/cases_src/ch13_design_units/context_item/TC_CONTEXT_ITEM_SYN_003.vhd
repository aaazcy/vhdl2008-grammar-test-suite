-- =============================================================
-- Case ID: TC_CONTEXT_ITEM_SYN_003
-- Rule Type: Syntax
-- BNF Production: context_item
-- IEEE Section: 13.2
-- BNF Text: context_item ::= library_clause | use_clause | context_reference
-- Test Focus: context_reference as a context_item — context keyword import (VHDL 2008)
-- Case Type: Positive
-- Expected Result: Compiles successfully (syntax valid; context resolution is a linking concern)
-- Dependencies: None
-- =============================================================
context standard_ops_context is
end context standard_ops_context;

library ieee;
use ieee.std_logic_1164.all;
context work.standard_ops_context;

entity tc_context_item_syn_003 is
  port (
    a : in  std_logic;
    y : out std_logic
  );
end entity tc_context_item_syn_003;

architecture rtl of tc_context_item_syn_003 is
begin
  y <= a;
end architecture rtl;
