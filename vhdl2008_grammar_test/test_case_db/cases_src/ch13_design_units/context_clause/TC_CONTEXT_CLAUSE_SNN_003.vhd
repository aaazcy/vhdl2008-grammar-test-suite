-- =============================================================
-- Case ID: TC_CONTEXT_CLAUSE_SNN_003
-- Rule Type: Syntax
-- BNF Production: context_clause
-- IEEE Section: 13.2
-- BNF Text: context_clause ::= { context_item }
-- Test Focus: context_clause with missing semicolon on context_item terminator
-- Case Type: Negative
-- Expected Result: Triggers syntax error: missing ';' after use clause
-- Dependencies: None
-- =============================================================
library ieee
use ieee.std_logic_1164.all;  -- ERROR: library clause above missing ';'

entity tc_context_clause_snn_003 is
  port (
    a : in  std_logic;
    y : out std_logic
  );
end entity tc_context_clause_snn_003;

architecture rtl of tc_context_clause_snn_003 is
begin
  y <= a;
end architecture rtl;
