-- =============================================================
-- Case ID: TC_CONTEXT_CLAUSE_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONTEXT_CLAUSE
-- Standard Reference: IEEE 1076-2008 Section 13.2
-- Production: context_clause ::= { context_item }
-- Case Type: Negative
-- Test Focus: SNN invalid context_item - signal declaration: signal bad : bit; — a signal declaration placed at the context_clause position is not a legal context_item (library_clause / use_clause / context_reference), verifying the parser rejects a non-context_item statement
-- Expected Result: Triggers syntax error: unexpected signal declaration in context_clause
-- Dependencies: None
-- =============================================================
library ieee;
signal bad_sig : bit;  -- ERROR: signal decl is not a context_item
use ieee.std_logic_1164.all;

entity cc_bad_item is
  port (
    y : out bit
  );
end entity cc_bad_item;

architecture rtl of cc_bad_item is
begin
  y <= '0';
end architecture rtl;
