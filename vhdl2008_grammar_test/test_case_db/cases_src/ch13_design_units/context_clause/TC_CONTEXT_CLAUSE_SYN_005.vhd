-- =============================================================
-- Case ID: TC_CONTEXT_CLAUSE_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONTEXT_CLAUSE
-- Standard Reference: IEEE 1076-2008 Section 13.2
-- Production: context_clause ::= { context_item }
-- Case Type: Positive
-- Test Focus: context_clause with context_reference: context work.my_context; — verifying context_clause contains a context_item of context_reference type referencing a declared context_declaration
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
context ctxt_pkg is
  library ieee;
  use ieee.std_logic_1164.all;
end context ctxt_pkg;

context work.ctxt_pkg;

entity cc_with_context is
  port (
    d : in  std_ulogic;
    q : out std_ulogic
  );
end entity cc_with_context;

architecture rtl of cc_with_context is
begin
  q <= d;
end architecture rtl;
