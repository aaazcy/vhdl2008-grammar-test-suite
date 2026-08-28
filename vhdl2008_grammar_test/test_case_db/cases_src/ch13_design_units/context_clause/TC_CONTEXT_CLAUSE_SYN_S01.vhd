-- =============================================================
-- Case ID: TC_CONTEXT_CLAUSE_SYN_S01
-- Rule Type: Syntax
-- BNF Production: context_clause
-- IEEE Section: 13.2
-- BNF Text: context_clause ::= { context_item }
-- Test Focus: context_clause with library and use clauses as context_items
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity tc_context_clause_syn_s01 is
  port (
    a : in  std_logic;
    y : out std_logic
  );
end entity tc_context_clause_syn_s01;

architecture rtl of tc_context_clause_syn_s01 is
begin
  y <= a;
end architecture rtl;
