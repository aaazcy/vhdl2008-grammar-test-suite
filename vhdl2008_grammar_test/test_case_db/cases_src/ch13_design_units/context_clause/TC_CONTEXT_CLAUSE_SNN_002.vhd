-- =============================================================
-- Case ID: TC_CONTEXT_CLAUSE_SNN_002
-- Rule Type: Syntax
-- BNF Production: context_clause
-- IEEE Section: 13.2
-- BNF Text: context_clause ::= { context_item }
-- Test Focus: Invalid context_clause — signal declaration is not a valid context_item
-- Case Type: Negative
-- Expected Result: Triggers syntax error: signal declaration not allowed in context_clause
-- Dependencies: None
-- =============================================================
library ieee;
signal bad_context_item : bit;  -- ERROR: signal decl is not a context_item
use ieee.std_logic_1164.all;

entity tc_context_clause_snn_002 is
  port (
    a : in  bit;
    y : out bit
  );
end entity tc_context_clause_snn_002;

architecture rtl of tc_context_clause_snn_002 is
begin
  y <= a;
end architecture rtl;
