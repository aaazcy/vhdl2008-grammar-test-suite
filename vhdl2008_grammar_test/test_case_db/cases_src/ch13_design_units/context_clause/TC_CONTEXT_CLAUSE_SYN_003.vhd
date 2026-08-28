-- =============================================================
-- Case ID: TC_CONTEXT_CLAUSE_SYN_003
-- Rule Type: Syntax
-- BNF Production: context_clause
-- IEEE Section: 13.2
-- BNF Text: context_clause ::= { context_item }
-- Test Focus: context_clause with context_reference as a context_item (VHDL 2008)
-- Case Type: Positive
-- Expected Result: Compiles successfully (referenced context may not resolve but syntax is valid)
-- Dependencies: None
-- =============================================================
context ieee_proposed_context is
end context ieee_proposed_context;

library ieee;
use ieee.std_logic_1164.all;
context work.ieee_proposed_context;

entity tc_context_clause_syn_003 is
  port (
    a : in  std_logic;
    y : out std_logic
  );
end entity tc_context_clause_syn_003;

architecture rtl of tc_context_clause_syn_003 is
begin
  y <= a;
end architecture rtl;
